import {
  IsDate,
  IsEnum,
  IsNumber,
  IsOptional,
  IsString,
} from 'class-validator';
import { Role } from 'generated/prisma';

export class UserDto {
  @IsNumber()
  @IsOptional()
  id?: number;

  @IsString()
  name: string;

  @IsString()
  email: string;

  @IsString()
  password: string;

  @IsEnum(Role)
  role: Role;

  @IsDate()
  createdAt: Date;

  @IsDate()
  updatedAt: Date;
}
