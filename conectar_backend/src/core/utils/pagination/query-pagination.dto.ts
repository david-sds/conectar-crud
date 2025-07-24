import { IsEnum, IsOptional } from 'class-validator';

enum Order {
  ASC = 'asc',
  DESC = 'desc',
}

export class QueryPaginationDto {
  @IsOptional()
  page: string = '';

  @IsOptional()
  size: string = '';

  @IsOptional()
  sortBy: string = 'id';

  @IsOptional()
  @IsEnum(Order)
  order: Order = Order.DESC;

  @IsOptional()
  search: string = '';
}
