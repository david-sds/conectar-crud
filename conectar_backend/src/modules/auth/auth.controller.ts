import { Controller } from '@nestjs/common';
import { AuthService } from './auth.service';

@Controller('auth')
export class AuthController {
  constructor(private readonly authService: AuthService) {}

  // @Post('login')
  // async login(@Body() credentials: CredentialsDto): Promise<void> {
  //   return await this.authService.login(credentials);
  // }

  // @Post('register')
  // async register(@Body() user: UserDto): Promise<void> {
  //   return await this.authService.register(user);
  // }
}
