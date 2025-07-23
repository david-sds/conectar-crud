import { plainToInstance } from 'class-transformer';
import { filterExcludeFromDto } from 'src/core/utils/dto.utils';
import { entityToAddressDto } from '../address/address.mapper';
import { ClientDto } from './dto/client.dto';

export function entityToClientDto(entity: any): ClientDto {
  const dto = plainToInstance(ClientDto, entity, filterExcludeFromDto);

  if (entity?.address) {
    dto.address = entityToAddressDto(entity?.address);
  }

  return plainToInstance(ClientDto, entity, filterExcludeFromDto);
}
