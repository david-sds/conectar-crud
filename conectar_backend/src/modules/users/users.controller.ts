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
import { Role } from 'generated/prisma';
import { Roles } from 'src/core/decorators/roles.decorator';
import { UserDto } from './dto/user.dto';
import { UsersService } from './users.service';

@Roles(Role.ADMIN)
@Controller('users')
export class UsersController {
  constructor(private readonly usersService: UsersService) {}

  @Get()
  findAll(): Promise<UserDto[]> {
    return this.usersService.findAll();
  }

  @Get(':id')
  findOne(@Param('id', ParseIntPipe) id: number): Promise<UserDto> {
    return this.usersService.findOne(id);
  }

  @Post()
  create(@Body() user: UserDto): Promise<UserDto> {
    return this.usersService.create(user);
  }

  @Patch(':id')
  update(
    @Param('id', ParseIntPipe) id: number,
    @Body() user: Partial<UserDto>,
  ): Promise<UserDto> {
    if (!user) {
      throw new BadRequestException('Invalid request body');
    }

    return this.usersService.update(id, user);
  }

  @Delete(':id')
  delete(@Param('id', ParseIntPipe) id: number): Promise<UserDto> {
    return this.usersService.delete(id);
  }
}
