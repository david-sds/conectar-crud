import { UnauthorizedException } from '@nestjs/common';
import { Request } from 'express';
import * as jwt from 'jsonwebtoken';
import { TokenDecodeDto } from 'src/modules/auth/dto/token-decode.dto';

const accessTokenSecret = process.env.ACCESS_TOKEN_SECRET;
const refreshTokenSecret = process.env.REFRESH_TOKEN_SECRET;

if (!accessTokenSecret || !refreshTokenSecret) {
  throw new Error('JWT secrets must be defined in env');
}

export function verifyAccessToken(token: string) {
  return verifyToken(token, accessTokenSecret);
}

export function verifyRefreshToken(token: string) {
  return verifyToken(token, refreshTokenSecret);
}

function verifyToken(token: string, secret: string) {
  try {
    return jwt.verify(token, secret);
  } catch (err) {
    throw new UnauthorizedException(`Invalid or expired token ${err}`);
  }
}

export function jwtDecode(req: Request): TokenDecodeDto {
  const authHeader = req.headers.authorization;
  const token = authHeader?.split(' ')[1];

  if (!token) {
    throw new UnauthorizedException();
  }

  const payload: any = verifyAccessToken(token);

  return payload as TokenDecodeDto;
}
