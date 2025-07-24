import { Injectable, UnauthorizedException } from '@nestjs/common';
import { JwtService } from '@nestjs/jwt';
import { User } from 'generated/prisma';
import { decrypt } from 'src/core/utils/encryption.utils';
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

const accessTokenExpiration = 60 * 60 * 12;
const refreshTokenExpiration = 60 * 60 * 24;

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

    const tokens = await this._getTokensFromUserEntity(userEntity);

    const isLastLoginUpdated = await this.authRepository.updateLastLogin(
      userEntity.id,
      tokens.refreshToken,
    );

    if (!isLastLoginUpdated) {
      throw new UnauthorizedException('Invalid credentials');
    }

    return tokens;
  }

  async refreshTokens(refreshToken: string): Promise<TokensDto> {
    try {
      const payload = await this.jwtService.verifyAsync<TokenDecodeDto>(
        refreshToken,
        {
          secret: process.env.REFRESH_TOKEN_SECRET,
        },
      );

      const userEntity = await this.authRepository.findUserEntityByEmail(
        payload.email,
      );

      if (!userEntity) {
        throw new UnauthorizedException('User no longer exists');
      }

      if (!userEntity.refreshToken) {
        throw new UnauthorizedException('Refresh token missing');
      }

      const decryptedStoredToken = decrypt(userEntity.refreshToken);

      if (decryptedStoredToken !== refreshToken) {
        throw new UnauthorizedException('Invalid refresh token');
      }

      const tokens = await this._getTokensFromUserEntity(userEntity);

      const isLastLoginUpdated = await this.authRepository.updateLastLogin(
        userEntity.id,
        tokens.refreshToken,
      );

      if (!isLastLoginUpdated) {
        throw new UnauthorizedException('Failed to update refresh token');
      }

      return tokens;
    } catch (e) {
      console.error(e);
      throw new UnauthorizedException('Invalid or expired refresh token');
    }
  }

  async _getTokensFromUserEntity(userEntity: User): Promise<TokensDto> {
    const payload: Partial<TokenDecodeDto> = {
      sub: userEntity.id,
      email: userEntity.email,
      role: userEntity.role,
    };

    const [accessToken, refreshToken] = await Promise.all([
      this.jwtService.signAsync(payload, {
        secret: process.env.ACCESS_TOKEN_SECRET,
        expiresIn: accessTokenExpiration,
      }),
      this.jwtService.signAsync(payload, {
        secret: process.env.REFRESH_TOKEN_SECRET,
        expiresIn: refreshTokenExpiration,
      }),
    ]);

    return <TokensDto>{
      accessToken,
      refreshToken,
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

  async logout(userId: number): Promise<void> {
    await this.authRepository.clearRefreshToken(userId);
  }
}
