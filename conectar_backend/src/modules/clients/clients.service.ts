import { Injectable, NotFoundException } from '@nestjs/common';
import { Role } from 'generated/prisma';
import {
  handlePrismaError,
  isPrismaKnownError,
} from 'src/core/utils/prisma-error-handler.util';
import { TokenDecodeDto } from '../auth/dto/token-decode.dto';
import { ClientsRepository } from './clients.repository';
import { ClientDto } from './dto/client.dto';

@Injectable()
export class ClientsService {
  constructor(private readonly clientsRepository: ClientsRepository) {}

  async findAll(tokenDecode: TokenDecodeDto): Promise<ClientDto[]> {
    if (tokenDecode.role === Role.ADMIN) {
      return await this.clientsRepository.findAll();
    }
    return this.clientsRepository.findAllByUser(tokenDecode.sub);
  }

  async findOne(id: number, tokenDecode: TokenDecodeDto): Promise<ClientDto> {
    try {
      const canUpdate = await this.canEditClient(id, tokenDecode);

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
      const canUpdate = await this.canEditClient(id, tokenDecode);

      if (!canUpdate) {
        throw new NotFoundException('Client not found');
      }

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

  async addClientsToUser(userId: number, clientIds: number[]): Promise<number> {
    return await this.clientsRepository.addClientsToUser(userId, clientIds);
  }

  async removeClientsFromUser(
    userId: number,
    clientIds: number[],
  ): Promise<number> {
    return await this.clientsRepository.removeClientsFromUser(
      userId,
      clientIds,
    );
  }

  async canEditClient(
    clientId: number,
    tokenDecode: TokenDecodeDto,
  ): Promise<boolean> {
    if (tokenDecode.role === Role.ADMIN) {
      return true;
    }

    return await this.clientsRepository.isClientFromUser(
      clientId,
      tokenDecode.sub,
    );
  }
}
