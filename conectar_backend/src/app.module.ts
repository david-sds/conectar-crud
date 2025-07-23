import { Module } from '@nestjs/common';
import { AppController } from './app.controller';
import { AppService } from './app.service';
import { PrismaModule } from './core/prisma/prisma.module';
import { AuthModule } from './modules/auth/auth.module';
import { ClientsModule } from './modules/clients/clients.module';
import { UsersModule } from './modules/users/users.module';

@Module({
  imports: [PrismaModule, UsersModule, ClientsModule, AuthModule],
  controllers: [AppController],
  providers: [AppService],
})
export class AppModule {}
