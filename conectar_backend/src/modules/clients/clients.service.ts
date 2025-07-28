import { Injectable, NotFoundException } from '@nestjs/common';
import { Role } from '@prisma/client';
import { PaginateOutput } from 'src/core/utils/pagination/pagination.utils';
import {
  handlePrismaError,
  isPrismaKnownError,
} from 'src/core/utils/prisma-error-handler.util';
import { TokenDecodeDto } from '../auth/dto/token-decode.dto';
import { UsersService } from '../users/users.service';
import { ClientsRepository } from './clients.repository';
import { ClientQueryDto } from './dto/client-query.dto';
import { ClientDto } from './dto/client.dto';

@Injectable()
export class ClientsService {
  constructor(
    private readonly clientsRepository: ClientsRepository,
    private readonly usersService: UsersService,
  ) {}

  async findAll(
    tokenDecode: TokenDecodeDto,
    query: ClientQueryDto,
  ): Promise<PaginateOutput<ClientDto>> {
    if (tokenDecode.role === Role.ADMIN) {
      return await this.clientsRepository.findAll(query);
    }
    return this.clientsRepository.findAllByUser(tokenDecode.sub, query);
  }

  async findOne(id: number, tokenDecode: TokenDecodeDto): Promise<ClientDto> {
    try {
      const canUpdate = await this.usersService.canEditClient(id, tokenDecode);

      if (!canUpdate) {
        throw new NotFoundException('Client not found');
      }

      const client = await this.clientsRepository.findOne(id);

      if (!client) {
        throw new NotFoundException('Client not found');
      }

      return client;
    } catch (e) {
      if (isPrismaKnownError(e)) {
        handlePrismaError(e);
      }
      throw e;
    }
  }

  async create(client: ClientDto): Promise<ClientDto> {
    try {
      return await this.clientsRepository.create(client);
    } catch (e) {
      if (isPrismaKnownError(e)) {
        handlePrismaError(e);
      }
      throw e;
    }
  }

  async update(
    id: number,
    client: Partial<ClientDto>,
    tokenDecode: TokenDecodeDto,
  ): Promise<ClientDto> {
    try {
      const canUpdate = await this.usersService.canEditClient(id, tokenDecode);

      if (!canUpdate) {
        throw new NotFoundException('Client not found');
      }

      console.log(client);

      return await this.clientsRepository.update(id, client);
    } catch (e) {
      if (isPrismaKnownError(e)) {
        handlePrismaError(e);
      }
      throw e;
    }
  }

  async delete(id: number): Promise<ClientDto> {
    try {
      return await this.clientsRepository.delete(id);
    } catch (e) {
      if (isPrismaKnownError(e)) {
        handlePrismaError(e);
      }
      throw e;
    }
  }
}
