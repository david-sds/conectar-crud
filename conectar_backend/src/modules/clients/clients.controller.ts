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
} from '@nestjs/common';
import { ClientsService } from './clients.service';
import { ClientDto } from './dto/client.dto';

@Controller('clients')
export class ClientsController {
  constructor(private readonly clientsService: ClientsService) {}

  @Get()
  findAll(): Promise<ClientDto[]> {
    return this.clientsService.findAll();
  }

  @Get(':id')
  findOne(@Param('id', ParseIntPipe) id: number): Promise<ClientDto> {
    return this.clientsService.findOne(id);
  }

  @Post()
  create(@Body() user: ClientDto): Promise<ClientDto> {
    return this.clientsService.create(user);
  }

  @Patch(':id')
  update(
    @Param('id', ParseIntPipe) id: number,
    @Body() client: Partial<ClientDto>,
  ): Promise<ClientDto> {
    if (!client) {
      throw new BadRequestException('Invalid request body');
    }

    return this.clientsService.update(id, client);
  }

  @Delete(':id')
  delete(@Param('id', ParseIntPipe) id: number): Promise<ClientDto> {
    return this.clientsService.delete(id);
  }
}
