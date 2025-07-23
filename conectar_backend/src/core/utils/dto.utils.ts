import { ClassTransformOptions } from 'class-transformer';

export const filterExcludeFromDto: ClassTransformOptions = {
  enableImplicitConversion: true,
  excludeExtraneousValues: true,
  exposeUnsetFields: true,
};
