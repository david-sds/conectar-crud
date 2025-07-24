import { Injectable } from '@nestjs/common';
import { User } from '@prisma/client';
import { PrismaService } from 'src/core/database/prisma.service';
import { encrypt } from 'src/core/utils/encryption.utils';
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

  async updateLastLogin(
    userId: number,
    refreshToken: string,
  ): Promise<boolean> {
    const entity = await this.prismaService.user.update({
      where: {
        id: userId,
      },
      data: {
        lastLogin: new Date(),
        refreshToken: encrypt(refreshToken),
      },
    });

    return !!entity;
  }

  async clearRefreshToken(userId: number): Promise<boolean> {
    const updated = await this.prismaService.user.update({
      where: { id: userId },
      data: { refreshToken: null },
    });
    return !!updated;
  }
}
