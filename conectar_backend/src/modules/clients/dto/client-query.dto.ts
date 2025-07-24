import { IntersectionType } from '@nestjs/mapped-types';
import { QueryPaginationDto } from 'src/core/utils/pagination/query-pagination.dto';
import { ClientSearchQueryDto } from './client-search-query.dto';

export class ClientQueryDto extends IntersectionType(
  ClientSearchQueryDto,
  QueryPaginationDto,
) {}
