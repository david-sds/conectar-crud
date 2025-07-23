import { Role } from 'generated/prisma';

export class TokenDecodeDto {
  sub: number;
  email: string;
  role: Role;
  iat: number;
  exp: number;
}
