import { Status } from '@prisma/client';
import { Expose, Type } from 'class-transformer';
import {
  IsBoolean,
  IsDate,
  IsEnum,
  IsInt,
  IsNotEmpty,
  IsOptional,
  IsString,
  Matches,
  ValidateNested,
} from 'class-validator';
import { AddressDto } from 'src/modules/address/dto/address.dto';

export class ClientDto {
  @Expose()
  @IsOptional()
  @IsInt()
  id?: number;

  @Expose()
  @IsString()
  @Matches(/^\d{14}$/, { message: 'cnpj must be a 14-digit number' })
  cnpj: string;

  @Expose()
  @IsString()
  name: string;

  @Expose()
  @IsString()
  legalName: string;

  @Expose()
  @IsEnum(Status)
  status: Status;

  @Expose()
  @IsBoolean()
  conectaPlus: boolean;

  @Expose()
  @IsNotEmpty()
  @ValidateNested()
  @Type(() => AddressDto)
  address: AddressDto;

  @Expose()
  @IsOptional()
  @IsDate()
  createdAt?: Date;

  @Expose()
  @IsOptional()
  @IsDate()
  updatedAt?: Date;
}
