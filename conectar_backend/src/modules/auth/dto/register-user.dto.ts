import { Role } from '@prisma/client';
import { Expose } from 'class-transformer';
import { IsDate, IsEnum, IsInt, IsOptional, IsString } from 'class-validator';

export class RegisterUserDto {
  @Expose()
  @IsOptional()
  @IsInt()
  id?: number;

  @Expose()
  @IsString()
  name: string;

  @Expose()
  @IsString()
  email: string;

  @Expose()
  @IsOptional()
  @IsString()
  password?: string;

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
