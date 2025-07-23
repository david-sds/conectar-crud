import {
	Injectable,
	OnApplicationShutdown,
	OnModuleDestroy,
	OnModuleInit,
} from '@nestjs/common';
import { PrismaClient } from '@prisma/client';

@Injectable()
export class PrismaService
	extends PrismaClient
	implements OnModuleInit, OnModuleDestroy, OnApplicationShutdown
{
	constructor() {
		super({
			datasources: {
				db: {
					url: process.env.ADMIN_DATABASE_URL,
				},
			},
			// log: ['query', 'info', 'warn', 'error'],
		});
	}
	async onModuleInit() {
		await this.$connect();
	}
	async onModuleDestroy() {
		await this.$disconnect();
	}
	async onApplicationShutdown(signal?: string | undefined) {
		process.on('beforeExit', async () => {
			await this.$disconnect();
		});
	}
}
