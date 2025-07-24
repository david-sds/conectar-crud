import { IntersectionType } from '@nestjs/mapped-types';
import { QueryPaginationDto } from 'src/core/utils/pagination/query-pagination.dto';
import { UserSearchQueryDto } from './user-search-query.dto';

export class UserQueryDto extends IntersectionType(
  UserSearchQueryDto,
  QueryPaginationDto,
) {}
