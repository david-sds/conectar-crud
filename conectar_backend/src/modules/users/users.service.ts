import { Injectable, NotFoundException } from '@nestjs/common';
import { Role } from 'generated/prisma';
import { PaginateOutput } from 'src/core/utils/pagination/pagination.utils';
import {
  handlePrismaError,
  isPrismaKnownError,
} from 'src/core/utils/prisma-error-handler.util';
import { TokenDecodeDto } from '../auth/dto/token-decode.dto';
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

  async findOne(id: number): Promise<UserDto> {
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

  async create(user: UserDto): Promise<UserDto> {
    try {
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

  async addClientsToUser(userId: number, clientIds: number[]): Promise<number> {
    try {
      return await this.usersRepository.addClientsToUser(userId, clientIds);
    } catch (e) {
      if (isPrismaKnownError(e)) {
        handlePrismaError(e);
      }
      throw e;
    }
  }

  async removeClientsFromUser(
    userId: number,
    clientIds: number[],
  ): Promise<number> {
    try {
      return await this.usersRepository.removeClientsFromUser(
        userId,
        clientIds,
      );
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
