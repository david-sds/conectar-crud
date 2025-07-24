import { Role } from '@prisma/client';

export class TokenDecodeDto {
  sub: number;
  email: string;
  role: Role;
  iat: number;
  exp: number;
}
