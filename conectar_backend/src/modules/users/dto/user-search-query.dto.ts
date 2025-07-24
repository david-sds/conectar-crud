import { Role } from '@prisma/client';
import { Transform } from 'class-transformer';
import { IsIn, IsOptional, IsString } from 'class-validator';

export class UserSearchQueryDto {
  @IsOptional()
  @IsString({})
  @Transform(({ value }) =>
    Array.isArray(value) ? value[value.length - 1] : value,
  )
  nome?: string;

  @IsOptional()
  @IsString({})
  @Transform(({ value }) =>
    Array.isArray(value) ? value[value.length - 1] : value,
  )
  email?: string;

  @IsOptional()
  @IsIn([Role.ADMIN, Role.USER])
  @Transform(({ value }) =>
    Array.isArray(value) ? value[value.length - 1] : value,
  )
  role?: Role;
}
