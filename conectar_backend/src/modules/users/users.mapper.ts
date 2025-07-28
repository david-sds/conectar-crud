import { plainToInstance } from 'class-transformer';
import { filterExcludeFromDto } from 'src/core/utils/dto.utils';
import { entityToClientDto } from '../clients/clients.mapper';
import { UserDetailsDto } from './dto/user-details.dto';
import { UserDto } from './dto/user.dto';

export function entityToUserDto(entity: any): UserDto {
  return plainToInstance(UserDto, entity, filterExcludeFromDto);
}

export function entityToUserDetailsDto(entity: any): UserDetailsDto {
  const userDetailsDto = plainToInstance(
    UserDetailsDto,
    entity,
    filterExcludeFromDto,
  );

  if (entity.userClients) {
    // eslint-disable-next-line @typescript-eslint/no-unsafe-call
    userDetailsDto.clients = (entity.userClients ?? []).map((entity: any) =>
      entityToClientDto(entity.client),
    );
  }

  return userDetailsDto;
}
