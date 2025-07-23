import { Body, Controller, Post } from '@nestjs/common';
import { UserDto } from '../users/dto/user.dto';
import { AuthService } from './auth.service';
import { CredentialsDto } from './dto/credentials.dto';

@Controller('auth')
export class AuthController {
  constructor(private readonly authService: AuthService) {}

  @Post('login')
  async login(@Body() credentials: CredentialsDto): Promise<void> {
    return this.authService.login(credentials);
  }

  @Post('register')
  async register(@Body() user: UserDto): Promise<void> {
    return this.authService.register(user);
  }
}
