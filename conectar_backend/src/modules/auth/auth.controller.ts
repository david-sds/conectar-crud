import { Body, Controller, Post } from '@nestjs/common';
import { Public } from 'src/core/decorators/public.decorator';
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
}
