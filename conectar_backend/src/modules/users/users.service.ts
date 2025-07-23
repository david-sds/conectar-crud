import { Injectable, NotFoundException } from '@nestjs/common';
import {
  handlePrismaError,
  isPrismaKnownError,
} from 'src/core/utils/prisma-error-handler.util';
import { UserDto } from './dto/user.dto';
import { UsersRepository } from './users.repository';

@Injectable()
export class UsersService {
  constructor(private readonly usersRepository: UsersRepository) {}

  async findAll(): Promise<UserDto[]> {
    return await this.usersRepository.findAll();
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
}
