import { plainToInstance } from 'class-transformer';
import { filterExcludeFromDto } from 'src/core/utils/dto.utils';
import { AddressDto } from './dto/address.dto';

export function entityToAddressDto(entity: any): AddressDto {
  return plainToInstance(AddressDto, entity, filterExcludeFromDto);
}
