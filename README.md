# conectar-crud

Este repositório contém dois projetos:

- **conectar_backend** – API NestJS com Prisma ORM, banco de dados PostgreSQL no Docker.
- **conectar_frontend** – Aplicação Flutter com Provider, seguindo a arquitetura MVVM.

## Como rodar localmente

### Backend

```bash
cd conectar_backend
docker-compose up -d
npm install
npx prisma migrate dev
npm run start:dev
```

### Frontend

```bash
cd conectar_frontend
flutter pub get
flutter run -d chrome
```
