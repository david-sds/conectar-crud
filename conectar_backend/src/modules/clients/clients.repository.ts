import { Injectable } from '@nestjs/common';
import { Prisma } from '@prisma/client';
import { PrismaService } from 'src/core/database/prisma.service';
import { entityToClientDto } from './clients.mapper';
import { ClientDto } from './dto/client.dto';
import { clientInclude } from './include/client.include';

@Injectable()
export class ClientsRepository {
  constructor(private readonly prismaService: PrismaService) {}

  async findAll(): Promise<ClientDto[]> {
    const entities = await this.prismaService.client.findMany({
      include: clientInclude,
    });

    return entities.map((e) => entityToClientDto(e));
  }

  async findOne(id: number): Promise<ClientDto | undefined> {
    const entity = await this.prismaService.client.findUnique({
      where: { id: id },
      include: clientInclude,
    });

    return entityToClientDto(entity);
  }

  async create(client: ClientDto): Promise<ClientDto> {
    const entity = await this.prismaService.client.create({
      data: {
        cnpj: client.cnpj,
        legalName: client.legalName,
        name: client.legalName,
        status: client.status,
        conectaPlus: client.conectaPlus,
        address: {
          create: {
            street: client.address.street,
            number: client.address.number,
            complement: client.address.complement,
            district: client.address.district,
            city: client.address.city,
            state: client.address.state,
            country: client.address.country,
            zipCode: client.address.zipCode,
          },
        },
      },
      include: clientInclude,
    });

    return entityToClientDto(entity);
  }

  async update(id: number, client: Partial<ClientDto>): Promise<ClientDto> {
    const data: Prisma.ClientUpdateInput = {
      cnpj: client.cnpj,
      legalName: client.legalName,
      name: client.legalName,
      status: client.status,
      conectaPlus: client.conectaPlus,
    };

    if (client.address && Object.keys(client.address).length > 0) {
      data.address = {
        update: {
          data: {
            street: client.address.street,
            number: client.address.number,
            complement: client.address.complement,
            district: client.address.district,
            city: client.address.city,
            state: client.address.state,
            country: client.address.country,
            zipCode: client.address.zipCode,
          },
          where: {
            clients: {
              some: {
                id: id,
              },
            },
          },
        },
      };
    }

    const entity = await this.prismaService.client.update({
      where: {
        id: id,
      },
      data: data,
      include: clientInclude,
    });

    return entityToClientDto(entity);
  }

  async delete(id: number): Promise<ClientDto> {
    const entity = await this.prismaService.$transaction(async (prisma) => {
      const entity = await prisma.client.delete({
        where: {
          id: id,
        },
        include: clientInclude,
      });

      await prisma.address.delete({ where: { id: entity.address.id } });

      return entity;
    });

    return entityToClientDto(entity);
  }
}
