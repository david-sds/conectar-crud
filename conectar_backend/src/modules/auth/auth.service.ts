import { Injectable, UnauthorizedException } from '@nestjs/common';
import { JwtService } from '@nestjs/jwt';
import { comparePassword, hashPassword } from 'src/core/utils/hash.utils';
import {
  handlePrismaError,
  isPrismaKnownError,
} from 'src/core/utils/prisma-error-handler.util';
import { UserDto } from '../users/dto/user.dto';
import { AuthRepository } from './auth.repository';
import { CredentialsDto } from './dto/credentials.dto';
import { RegisterUserDto } from './dto/register-user.dto';
import { TokenDecodeDto } from './dto/token-decode.dto';
import { TokensDto } from './dto/tokens.dto';

@Injectable()
export class AuthService {
  constructor(
    private readonly authRepository: AuthRepository,
    private readonly jwtService: JwtService,
  ) {}

  async login(credentials: CredentialsDto): Promise<TokensDto> {
    const { email, password } = credentials;

    const userEntity = await this.authRepository.findUserEntityByEmail(email);

    if (!userEntity) {
      throw new UnauthorizedException('Invalid credentials');
    }

    const isPasswordValid = await comparePassword(
      password,
      userEntity.password,
    );

    if (!isPasswordValid) {
      throw new UnauthorizedException('Invalid credentials');
    }

    const accessTokenExpiration = 60 * 60 * 12;
    const refreshTokenExpiration = 60 * 60 * 24;

    const payload: Partial<TokenDecodeDto> = {
      sub: userEntity.id,
      email: userEntity.email,
      role: userEntity.role,
    };

    const [access_token, refresh_token] = await Promise.all([
      this.jwtService.signAsync(payload, {
        secret: process.env.ACCESS_TOKEN_SECRET,
        expiresIn: accessTokenExpiration,
      }),
      this.jwtService.signAsync(payload, {
        secret: process.env.REFRESH_TOKEN_SECRET,
        expiresIn: refreshTokenExpiration,
      }),
    ]);

    return {
      access_token,
      refresh_token,
    };
  }

  async register(registerUser: RegisterUserDto): Promise<UserDto> {
    try {
      const hashedPassword = await hashPassword(registerUser.password);

      const userWithHashedPassword = {
        ...registerUser,
        password: hashedPassword,
      };

      return await this.authRepository.register(userWithHashedPassword);
    } catch (e) {
      if (isPrismaKnownError(e)) {
        handlePrismaError(e);
      }
      throw e;
    }
  }
}
