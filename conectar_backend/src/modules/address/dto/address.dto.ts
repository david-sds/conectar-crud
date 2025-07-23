import { Expose } from 'class-transformer';
import {
  IsDate,
  IsNumber,
  IsOptional,
  IsString,
  Matches,
} from 'class-validator';

export class AddressDto {
  @Expose()
  @IsOptional()
  @IsNumber()
  id?: number;

  @Expose()
  @IsString()
  number: string;

  @Expose()
  @IsString()
  street: string;

  @Expose()
  @IsString()
  district: string;

  @Expose()
  @IsString()
  city: string;

  @Expose()
  @IsString()
  state: string;

  @Expose()
  @IsString()
  country: string;

  @Expose()
  @IsString()
  @Matches(/^\d{8}$/, { message: 'zipCode must be a 8-digit number' })
  zipCode: string;

  @Expose()
  @IsString()
  @IsOptional()
  complement?: string;

  @Expose()
  @IsOptional()
  @IsDate()
  createdAt?: Date;

  @Expose()
  @IsOptional()
  @IsDate()
  updatedAt?: Date;
}
