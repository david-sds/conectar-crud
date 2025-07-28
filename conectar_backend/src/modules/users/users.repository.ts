import { BadRequestException, Injectable } from '@nestjs/common';
import { Prisma } from '@prisma/client';
import { PrismaService } from 'src/core/database/prisma.service';
import {
  paginate,
  PaginateOutput,
  paginateOutput,
} from 'src/core/utils/pagination/pagination.utils';
import { RegisterUserDto } from '../auth/dto/register-user.dto';
import { ManageClientsDto } from '../clients/dto/manage-client.dto';
import { UserDetailsDto } from './dto/user-details.dto';
import { UserQueryDto } from './dto/user-query.dto';
import { UserDto } from './dto/user.dto';
import { userDetailsInclude } from './include/user-details.include';
import { entityToUserDetailsDto, entityToUserDto } from './users.mapper';

const sortByTypes = ['id', 'name', 'email', 'role', 'createdAt', 'updatedAt'];

@Injectable()
export class UsersRepository {
  constructor(private prismaService: PrismaService) {}

  async findAll(query: UserQueryDto): Promise<PaginateOutput<UserDto>> {
    if (!sortByTypes.includes(query.sortBy)) {
      throw new BadRequestException(
        `You can only sortBy [${sortByTypes.join(', ')}]`,
      );
    }

    const where = this._userFiltersWhere(query);

    const sortBy: any = {};
    switch (query.sortBy) {
      default:
        sortBy[query.sortBy] = query.order;
        break;
    }

    const [userEntities, total] = await Promise.all([
      await this.prismaService.user.findMany({
        ...paginate(query),
        where: where,
        orderBy: sortBy,
      }),
      await this.prismaService.user.count({ where }),
    ]);

    return paginateOutput<UserDto>(
      userEntities.map((e) => entityToUserDto(e)),
      total,
      query,
    );
  }

  _userFiltersWhere(query: UserQueryDto): Prisma.UserWhereInput {
    const where = { AND: [] as Prisma.UserWhereInput[] };

    if (query.nome) {
      where.AND.push({
        name: {
          contains: query.nome,
          mode: 'insensitive',
        },
      });
    }
    if (query.email) {
      where.AND.push({
        email: {
          contains: query.email,
          mode: 'insensitive',
        },
      });
    }
    if (query.role) {
      where.AND.push({
        role: query.role,
      });
    }

    return where;
  }

  async findInactiveUsers(sinceDays = 30): Promise<UserDto[]> {
    const dateThreshold = new Date();
    dateThreshold.setDate(dateThreshold.getDate() - sinceDays);

    const entities = await this.prismaService.user.findMany({
      where: {
        OR: [{ lastLogin: { lt: dateThreshold } }],
      },
    });

    return entities.map((e) => entityToUserDto(e));
  }

  async findOne(id: number): Promise<UserDetailsDto> {
    const entity = await this.prismaService.user.findUnique({
      where: { id: id },
      include: userDetailsInclude,
    });

    return entityToUserDetailsDto(entity);
  }

  async findOneByEmail(email: string): Promise<UserDto> {
    const entity = await this.prismaService.user.findUnique({
      where: { email: email },
    });

    return entityToUserDto(entity);
  }

  async create(user: RegisterUserDto): Promise<UserDto> {
    const entity = await this.prismaService.user.create({
      data: {
        email: user.email,
        password: user.password,
        name: user.name,
        role: user.role,
      },
    });

    return entityToUserDto(entity);
  }

  async update(id: number, user: Partial<UserDto>): Promise<UserDto> {
    const entity = await this.prismaService.user.update({
      where: {
        id: id,
      },
      data: {
        email: user.email,
        name: user.name,
        role: user.role,
      },
    });

    return entityToUserDto(entity);
  }

  async delete(id: number): Promise<UserDto> {
    const entity = await this.prismaService.user.delete({
      where: {
        id: id,
      },
    });

    return entityToUserDto(entity);
  }

  async updateClientsUser(userId: number, payload: ManageClientsDto) {
    const createManyArgs: Prisma.UserClientCreateManyArgs = {
      data: payload.addClientIds.map((clientId) => ({
        clientId: clientId,
        userId: userId,
      })),
    };
    const removeManyArgs: Prisma.UserClientDeleteManyArgs = {
      where: {
        clientId: {
          in: payload.removeClientIds,
        },
        userId: userId,
      },
    };

    await this.prismaService.$transaction(async (prisma) => {
      await prisma.userClient.deleteMany(removeManyArgs);
      await prisma.userClient.createMany(createManyArgs);
    });
  }

  async isClientFromUser(clientId: number, userId: number): Promise<boolean> {
    const result = await this.prismaService.userClient.findUnique({
      where: {
        userId_clientId: {
          clientId: clientId,
          userId: userId,
        },
      },
    });

    return result !== null;
  }
}
