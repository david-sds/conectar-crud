import { Status } from '@prisma/client';
import { Transform } from 'class-transformer';
import { IsIn, IsOptional, IsString } from 'class-validator';

export class ClientSearchQueryDto {
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
  cnpj?: string;

  @IsOptional()
  @IsIn([Status.ACTIVE, Status.INACTIVE])
  @Transform(({ value }) =>
    Array.isArray(value) ? value[value.length - 1] : value,
  )
  status?: Status;

  @IsOptional()
  @IsIn(['true', 'false'])
  @Transform(({ value }) =>
    Array.isArray(value) ? value[value.length - 1] : value,
  )
  conectaPlus?: string;
}
