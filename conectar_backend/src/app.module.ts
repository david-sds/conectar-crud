import { Module } from '@nestjs/common';
import { AppController } from './app.controller';
import { AppService } from './app.service';
import { UsersModule } from './modules/users/users.module';
import { ClientsModule } from './modules/clients/clients.module';
import { AuthModule } from './modules/auth/auth.module';

@Module({
  imports: [UsersModule, ClientsModule, AuthModule],
  controllers: [AppController],
  providers: [AppService],
})
export class AppModule {}
