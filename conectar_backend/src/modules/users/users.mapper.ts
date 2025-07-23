import { plainToInstance } from 'class-transformer';
import { filterExcludeFromDto } from 'src/core/utils/dto.utils';
import { UserDto } from './dto/user.dto';

export function entityToUserDto(entity: any): UserDto {
  return plainToInstance(UserDto, entity, filterExcludeFromDto);
}
