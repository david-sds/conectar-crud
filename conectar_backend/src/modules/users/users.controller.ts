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
import { UserDto } from './dto/user.dto';
import { UsersService } from './users.service';

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
