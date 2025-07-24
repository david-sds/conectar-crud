import { BadRequestException, Injectable } from '@nestjs/common';
import { Prisma } from '@prisma/client';
import { PrismaService } from 'src/core/database/prisma.service';
import {
  paginate,
  paginateOutput,
  PaginateOutput,
} from 'src/core/utils/pagination/pagination.utils';
import { entityToClientDto } from './clients.mapper';
import { ClientQueryDto } from './dto/client-query.dto';
import { ClientDto } from './dto/client.dto';
import { clientInclude } from './include/client.include';

const sortByTypes = [
  'id',
  'cnpj',
  'name',
  'legalName',
  'status',
  'conectaPlus',
  'address',
  'createdAt',
  'updatedAt',
];

@Injectable()
export class ClientsRepository {
  constructor(private readonly prismaService: PrismaService) {}

  async findAll(query: ClientQueryDto): Promise<PaginateOutput<ClientDto>> {
    if (!sortByTypes.includes(query.sortBy)) {
      throw new BadRequestException(
        `You can only sortBy [${sortByTypes.join(', ')}]`,
      );
    }

    const where = this._clientFiltersWhere(query);

    const sortBy: any = {};
    switch (query.sortBy) {
      default:
        sortBy[query.sortBy] = query.order;
        break;
    }

    const [clientEntities, total] = await Promise.all([
      await this.prismaService.client.findMany({
        ...paginate(query),
        where: where,
        orderBy: sortBy,
        include: clientInclude,
      }),
      await this.prismaService.client.count({ where }),
    ]);

    return paginateOutput<ClientDto>(
      clientEntities.map((e) => entityToClientDto(e)),
      total,
      query,
    );
  }

  async findAllByUser(
    userId: number,
    query: ClientQueryDto,
  ): Promise<PaginateOutput<ClientDto>> {
    const where: Prisma.ClientWhereInput = {
      userClients: {
        some: {
          userId: userId,
        },
      },
      ...this._clientFiltersWhere(query),
    };

    if (!sortByTypes.includes(query.sortBy)) {
      throw new BadRequestException(
        `You can only sortBy [${sortByTypes.join(', ')}]`,
      );
    }

    const sortBy: any = {};
    switch (query.sortBy) {
      default:
        sortBy[query.sortBy] = query.order;
        break;
    }

    const [clientEntities, total] = await Promise.all([
      await this.prismaService.client.findMany({
        ...paginate(query),
        where: where,
        orderBy: sortBy,
        include: clientInclude,
      }),
      await this.prismaService.client.count({ where }),
    ]);

    return paginateOutput<ClientDto>(
      clientEntities.map((e) => entityToClientDto(e)),
      total,
      query,
    );
  }

  _clientFiltersWhere(query: ClientQueryDto): Prisma.ClientWhereInput {
    const where = { AND: [] as Prisma.ClientWhereInput[] };

    if (query.nome) {
      where.AND.push({
        name: {
          contains: query.nome,
          mode: 'insensitive',
        },
      });
    }
    if (query.cnpj) {
      const cnpjNumbers = query.cnpj.replace(/\D/g, '');
      where.AND.push({
        cnpj: {
          contains: cnpjNumbers,
        },
      });
    }
    if (query.conectaPlus) {
      const isConectaPlus =
        query.conectaPlus === 'true'
          ? true
          : query.conectaPlus === 'false'
            ? false
            : null;

      if (isConectaPlus !== null) {
        where.AND.push({ conectaPlus: isConectaPlus });
      }
    }
    if (query.status) {
      where.AND.push({
        status: query.status,
      });
    }

    return where;
  }

  async findOne(id: number): Promise<ClientDto | undefined> {
    const entity = await this.prismaService.client.findUnique({
      where: { id: id },
      include: clientInclude,
    });

    return entityToClientDto(entity);
  }

  async create(client: ClientDto): Promise<ClientDto> {
    const entity = await this.prismaService.client.create({
      data: {
        cnpj: client.cnpj,
        legalName: client.legalName,
        name: client.legalName,
        status: client.status,
        conectaPlus: client.conectaPlus,
        address: {
          create: {
            street: client.address.street,
            number: client.address.number,
            complement: client.address.complement,
            district: client.address.district,
            city: client.address.city,
            state: client.address.state,
            country: client.address.country,
            zipCode: client.address.zipCode,
          },
        },
      },
      include: clientInclude,
    });

    return entityToClientDto(entity);
  }

  async update(id: number, client: Partial<ClientDto>): Promise<ClientDto> {
    const data: Prisma.ClientUpdateInput = {
      cnpj: client.cnpj,
      legalName: client.legalName,
      name: client.legalName,
      status: client.status,
      conectaPlus: client.conectaPlus,
    };

    if (client.address && Object.keys(client.address).length > 0) {
      data.address = {
        update: {
          data: {
            street: client.address.street,
            number: client.address.number,
            complement: client.address.complement,
            district: client.address.district,
            city: client.address.city,
            state: client.address.state,
            country: client.address.country,
            zipCode: client.address.zipCode,
          },
          where: {
            clients: {
              some: {
                id: id,
              },
            },
          },
        },
      };
    }

    const entity = await this.prismaService.client.update({
      where: {
        id: id,
      },
      data: data,
      include: clientInclude,
    });

    return entityToClientDto(entity);
  }

  async delete(id: number): Promise<ClientDto> {
    const entity = await this.prismaService.$transaction(async (prisma) => {
      const entity = await prisma.client.delete({
        where: {
          id: id,
        },
        include: clientInclude,
      });

      await prisma.address.delete({ where: { id: entity.address.id } });

      return entity;
    });

    return entityToClientDto(entity);
  }

  async addClientsToUser(userId: number, clientIds: number[]): Promise<number> {
    const data: Prisma.UserClientCreateManyInput[] = clientIds.map(
      (clientId) => ({
        clientId: clientId,
        userId: userId,
      }),
    );

    const result = await this.prismaService.userClient.createMany({
      data: data,
      skipDuplicates: true,
    });

    return result.count;
  }

  async removeClientsFromUser(
    userId: number,
    clientIds: number[],
  ): Promise<number> {
    const result = await this.prismaService.userClient.deleteMany({
      where: {
        clientId: {
          in: clientIds,
        },
        userId: userId,
      },
    });

    return result.count;
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
