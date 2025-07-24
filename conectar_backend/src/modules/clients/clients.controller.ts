import {
  BadRequestException,
  Body,
  Controller,
  Delete,
  Get,
  Param,
  ParseIntPipe,
  Patch,
  Post,
  Query,
  Req,
} from '@nestjs/common';
import { Request } from 'express';
import { Role } from 'generated/prisma';
import { Roles } from 'src/core/decorators/roles.decorator';
import { jwtDecode } from 'src/core/utils/jwt.utils';
import { PaginateOutput } from 'src/core/utils/pagination/pagination.utils';
import { QueryPaginationDto } from 'src/core/utils/pagination/query-pagination.dto';
import { ClientsService } from './clients.service';
import { ClientDto } from './dto/client.dto';
import { ManageClientsDto } from './dto/manage-client.dto';

@Controller('clients')
export class ClientsController {
  constructor(private readonly clientsService: ClientsService) {}

  @Roles(Role.ADMIN, Role.USER)
  @Get()
  findAll(
    @Req() req: Request,
    @Query() query: QueryPaginationDto,
  ): Promise<PaginateOutput<ClientDto>> {
    const tokenDecode = jwtDecode(req);

    return this.clientsService.findAll(tokenDecode, query);
  }

  @Roles(Role.ADMIN, Role.USER)
  @Get(':id')
  findOne(
    @Req() req: Request,
    @Param('id', ParseIntPipe) id: number,
  ): Promise<ClientDto> {
    const tokenDecode = jwtDecode(req);

    return this.clientsService.findOne(id, tokenDecode);
  }

  @Roles(Role.ADMIN)
  @Post()
  create(@Body() user: ClientDto): Promise<ClientDto> {
    return this.clientsService.create(user);
  }

  @Roles(Role.ADMIN, Role.USER)
  @Patch(':id')
  update(
    @Req() req: Request,
    @Param('id', ParseIntPipe) id: number,
    @Body() client: Partial<ClientDto>,
  ): Promise<ClientDto> {
    const tokenDecode = jwtDecode(req);

    if (!client) {
      throw new BadRequestException('Invalid request body');
    }

    return this.clientsService.update(id, client, tokenDecode);
  }

  @Roles(Role.ADMIN)
  @Delete(':id')
  delete(@Param('id', ParseIntPipe) id: number): Promise<ClientDto> {
    return this.clientsService.delete(id);
  }

  @Roles(Role.ADMIN)
  @Patch('add-to-user/:id')
  addClientsToUser(
    @Param('id', ParseIntPipe) userId: number,
    @Body() payload: ManageClientsDto,
  ): Promise<number> {
    return this.clientsService.addClientsToUser(userId, payload.clientIds);
  }

  @Roles(Role.ADMIN)
  @Patch('remove-from-user/:id')
  removeClientsFromUser(
    @Param('id', ParseIntPipe) userId: number,
    @Body() payload: ManageClientsDto,
  ): Promise<number> {
    return this.clientsService.removeClientsFromUser(userId, payload.clientIds);
  }
}
