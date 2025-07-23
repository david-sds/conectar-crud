import { Injectable } from '@nestjs/common';
import { User } from '@prisma/client';
import { PrismaService } from 'src/core/database/prisma.service';
import { UserDto } from '../users/dto/user.dto';
import { entityToUserDto } from '../users/users.mapper';
import { RegisterUserDto } from './dto/register-user.dto';

@Injectable()
export class AuthRepository {
  constructor(private readonly prismaService: PrismaService) {}

  async findUserEntityByEmail(email: string): Promise<User | undefined> {
    const entity = await this.prismaService.user.findFirst({
      where: { email: email },
    });

    return entity;
  }

  async register(user: RegisterUserDto): Promise<UserDto> {
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
}
