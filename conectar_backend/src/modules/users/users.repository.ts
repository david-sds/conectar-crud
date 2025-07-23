import { Injectable } from '@nestjs/common';
import { PrismaService } from 'src/core/database/prisma.service';
import { UserDto } from './dto/user.dto';
import { entityToUserDto } from './users.mapper';

@Injectable()
export class UsersRepository {
  constructor(private prismaService: PrismaService) {}

  async findAll(): Promise<UserDto[]> {
    const entities = await this.prismaService.user.findMany();

    return entities.map((e) => entityToUserDto(e));
  }

  async findOne(id: number): Promise<UserDto> {
    const entity = await this.prismaService.user.findUnique({
      where: { id: id },
    });

    return entityToUserDto(entity);
  }

  async findOneByEmail(email: string): Promise<UserDto> {
    const entity = await this.prismaService.user.findUnique({
      where: { email: email },
    });

    return entityToUserDto(entity);
  }

  async create(user: UserDto): Promise<UserDto> {
    const entity = await this.prismaService.user.create({
      data: {
        email: user.email,
        password: process.env.DEFAULT_PASSWORD,
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
}
