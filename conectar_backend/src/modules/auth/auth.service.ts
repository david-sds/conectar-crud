import { Injectable } from '@nestjs/common';

@Injectable()
export class AuthService {
  async login(credentials: CredentialsDto): Promise<void> {}

  async register(user: UserDto): Promise<void> {}
}
