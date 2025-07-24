import { Body, Controller, Post, Req } from '@nestjs/common';
import { Request } from 'express';
import { Public } from 'src/core/decorators/public.decorator';
import { jwtDecode } from 'src/core/utils/jwt.utils';
import { UserDto } from '../users/dto/user.dto';
import { AuthService } from './auth.service';
import { CredentialsDto } from './dto/credentials.dto';
import { refreshTokenDto } from './dto/refresh-token.dto';
import { RegisterUserDto } from './dto/register-user.dto';
import { TokensDto } from './dto/tokens.dto';

@Public()
@Controller('auth')
export class AuthController {
  constructor(private readonly authService: AuthService) {}

  @Post('login')
  async login(@Body() credentials: CredentialsDto): Promise<TokensDto> {
    return await this.authService.login(credentials);
  }

  @Post('register')
  async register(@Body() registerUser: RegisterUserDto): Promise<UserDto> {
    return await this.authService.register(registerUser);
  }

  @Post('refresh')
  async refresh(@Body() refreshTokenDto: refreshTokenDto): Promise<TokensDto> {
    return await this.authService.refreshTokens(refreshTokenDto.refreshToken);
  }

  @Post('logout')
  async logout(@Req() req: Request): Promise<void> {
    const tokenDecodeDto = jwtDecode(req);
    return await this.authService.logout(tokenDecodeDto.sub);
  }
}
