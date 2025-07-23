import { Injectable } from '@nestjs/common';
import { PrismaService } from 'src/core/database/prisma.service';
import { UserDto } from '../users/dto/user.dto';
import { entityToUserDto } from '../users/users.mapper';
import { CredentialsDto } from './dto/credentials.dto';
import { RegisterUserDto } from './dto/register-user.dto';

@Injectable()
export class AuthRepository {
  constructor(private readonly prismaService: PrismaService) {}

  async findUserByCredentials(
    credentials: CredentialsDto,
  ): Promise<UserDto | undefined> {
    const entity = await this.prismaService.user.findFirst({
      where: { email: credentials.email, password: credentials.password },
    });

    return entityToUserDto(entity);
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
