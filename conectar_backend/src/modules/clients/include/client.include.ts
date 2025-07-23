import { Prisma } from '@prisma/client';

export const clientInclude: Prisma.ClientInclude = {
  address: true,
};
