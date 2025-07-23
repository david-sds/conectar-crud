import { Injectable, NotFoundException } from '@nestjs/common';
import {
  handlePrismaError,
  isPrismaKnownError,
} from 'src/core/utils/prisma-error-handler.util';
import { ClientsRepository } from './clients.repository';
import { ClientDto } from './dto/client.dto';

@Injectable()
export class ClientsService {
  constructor(private readonly clientsRepository: ClientsRepository) {}

  async findAll(): Promise<ClientDto[]> {
    return await this.clientsRepository.findAll();
  }

  async findOne(id: number): Promise<ClientDto> {
    try {
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

  async update(id: number, client: Partial<ClientDto>): Promise<ClientDto> {
    try {
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
