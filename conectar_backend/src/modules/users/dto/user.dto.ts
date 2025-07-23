import { Role } from '@prisma/client';
import { Expose } from 'class-transformer';
import {
  IsDate,
  IsEnum,
  IsNumber,
  IsOptional,
  IsString,
} from 'class-validator';

export class UserDto {
  @Expose()
  @IsOptional()
  @IsNumber()
  id?: number;

  @Expose()
  @IsString()
  name: string;

  @Expose()
  @IsString()
  email: string;

  @Expose()
  @IsEnum(Role)
  role: Role;

  @Expose()
  @IsOptional()
  @IsDate()
  createdAt?: Date;

  @Expose()
  @IsOptional()
  @IsDate()
  updatedAt?: Date;
}
