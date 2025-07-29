# conectar-crud

Monorepo com dois projetos:

- **conectar_backend** – API NestJS com Prisma e Docker.
- **conectar_frontend** – Aplicação Flutter Web com Freezed.

## Backend

```bash
cd conectar_backend
docker-compose up -d
npm install
npx prisma migrate dev
npm run start:dev
```

## Frontend

```bash
cd conectar_frontend
flutter pub get
flutter run -d chrome
```
