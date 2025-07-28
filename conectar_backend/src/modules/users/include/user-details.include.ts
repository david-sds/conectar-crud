import { Prisma } from '@prisma/client';
import { clientInclude } from 'src/modules/clients/include/client.include';

export const userDetailsInclude: Prisma.UserInclude = {
  userClients: {
    include: {
      client: {
        include: clientInclude,
      },
    },
  },
};
