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
import { UserQueryDto } from './dto/user-query.dto';
import { UserDto } from './dto/user.dto';
import { UsersService } from './users.service';

@Controller('users')
export class UsersController {
  constructor(private readonly usersService: UsersService) {}

  @Roles(Role.ADMIN)
  @Get()
  findAll(@Query() query: UserQueryDto): Promise<PaginateOutput<UserDto>> {
    return this.usersService.findAll(query);
  }

  @Roles(Role.ADMIN, Role.USER)
  @Get('me')
  findMe(@Req() req: Request): Promise<UserDto> {
    const tokenDecodeDto = jwtDecode(req);
    return this.usersService.findOne(tokenDecodeDto.sub);
  }

  @Roles(Role.ADMIN)
  @Get('inactive')
  findInactiveUsers(): Promise<UserDto[]> {
    return this.usersService.findInactiveUsers();
  }

  @Roles(Role.ADMIN)
  @Get(':id')
  findOne(@Param('id', ParseIntPipe) id: number): Promise<UserDto> {
    return this.usersService.findOne(id);
  }

  @Roles(Role.ADMIN)
  @Post()
  create(@Body() user: UserDto): Promise<UserDto> {
    return this.usersService.create(user);
  }

  @Roles(Role.ADMIN)
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

  @Roles(Role.ADMIN)
  @Delete(':id')
  delete(@Param('id', ParseIntPipe) id: number): Promise<UserDto> {
    return this.usersService.delete(id);
  }
}
