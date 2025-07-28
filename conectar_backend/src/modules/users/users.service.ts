import {
  BadRequestException,
  Injectable,
  NotFoundException,
} from '@nestjs/common';
import { Role } from 'generated/prisma';
import { hashPassword } from 'src/core/utils/hash.utils';
import { PaginateOutput } from 'src/core/utils/pagination/pagination.utils';
import {
  handlePrismaError,
  isPrismaKnownError,
} from 'src/core/utils/prisma-error-handler.util';
import { RegisterUserDto } from '../auth/dto/register-user.dto';
import { TokenDecodeDto } from '../auth/dto/token-decode.dto';
import { ManageClientsDto } from '../clients/dto/manage-client.dto';
import { UserDetailsDto } from './dto/user-details.dto';
import { UserQueryDto } from './dto/user-query.dto';
import { UserDto } from './dto/user.dto';
import { UsersRepository } from './users.repository';

@Injectable()
export class UsersService {
  constructor(private readonly usersRepository: UsersRepository) {}

  async findAll(query: UserQueryDto): Promise<PaginateOutput<UserDto>> {
    return await this.usersRepository.findAll(query);
  }

  async findInactiveUsers(): Promise<UserDto[]> {
    return await this.usersRepository.findInactiveUsers(30);
  }

  async findOne(id: number): Promise<UserDetailsDto> {
    try {
      const user = await this.usersRepository.findOne(id);

      if (!user) {
        throw new NotFoundException('User not found');
      }

      return user;
    } catch (e) {
      if (isPrismaKnownError(e)) {
        handlePrismaError(e);
      }
      throw e;
    }
  }

  async findOneByEmail(email: string): Promise<UserDto> {
    try {
      const user = await this.usersRepository.findOneByEmail(email);

      if (!user) {
        throw new NotFoundException('User not found');
      }

      return user;
    } catch (e) {
      if (isPrismaKnownError(e)) {
        handlePrismaError(e);
      }
      throw e;
    }
  }

  async create(user: RegisterUserDto): Promise<UserDto> {
    try {
      const unencryptedPassword = user.password ?? process.env.DEFAULT_PASSWORD;

      if (!unencryptedPassword) {
        throw new BadRequestException('Invalid password');
      }

      user.password = await hashPassword(unencryptedPassword);

      return await this.usersRepository.create(user);
    } catch (e) {
      if (isPrismaKnownError(e)) {
        handlePrismaError(e);
      }
      throw e;
    }
  }

  async update(id: number, user: Partial<UserDto>): Promise<UserDto> {
    try {
      return await this.usersRepository.update(id, user);
    } catch (e) {
      if (isPrismaKnownError(e)) {
        handlePrismaError(e);
      }
      throw e;
    }
  }

  async delete(id: number): Promise<UserDto> {
    try {
      return await this.usersRepository.delete(id);
    } catch (e) {
      if (isPrismaKnownError(e)) {
        handlePrismaError(e);
      }
      throw e;
    }
  }

  async updateClientsUser(userId: number, payload: ManageClientsDto) {
    try {
      return await this.usersRepository.updateClientsUser(userId, payload);
    } catch (e) {
      if (isPrismaKnownError(e)) {
        handlePrismaError(e);
      }
      throw e;
    }
  }

  async canEditClient(
    clientId: number,
    tokenDecode: TokenDecodeDto,
  ): Promise<boolean> {
    if (tokenDecode.role === Role.ADMIN) {
      return true;
    }

    return await this.usersRepository.isClientFromUser(
      clientId,
      tokenDecode.sub,
    );
  }
}
