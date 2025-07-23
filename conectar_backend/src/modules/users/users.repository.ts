import { Injectable } from '@nestjs/common';
import { PrismaService } from 'src/core/prisma/prisma.service';

@Injectable()
export class UsersRepository {
  constructor(private readonly prismaService: PrismaService) {}

  findAll(): Promise<UserDto[]> {
    return this.prismaService.;
  }

  findOne(id: number): Promise<UserDto> {
    return this.usersRepository.findOne(id);
  }

  create(user: UserDto): Promise<UserDto> {
    return this.usersRepository.create(user);
  }

  update(id: number, user: Partial<UserDto>): Promise<UserDto> {
    return this.usersRepository.update(id, user);
  }

  delete(id: number): Promise<void> {
    return this.usersRepository.delete(id);
  }
}
