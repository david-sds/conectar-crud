# conectar-crud

## Descrição

Este é um projeto relativo ao desafio técnico do processo seletivo da Conéctar.

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

## Arquitetura

- **Backend**
    - NestJS modularizado
    - Injeção de dependências.
    - Prisma ORM com PostgreSQL, usando Migrations.
    - Docker Compose para ambiente local.
    - Validação com DTOs e use cases separados de controllers.

- **Frontend**
    - Flutter Web com arquitetura MVVM.
    - Injeção de dependências.
    - Gerenciamento de estado via Provider + ChangeNotifier.
    - Utilização de Freezed e build_runner para gerar modelos imutáveis.
    - GoRouter para navegação declarativa com guards.

- **Autenticação**
    Backend gera JWT, armazenado no frontend.
    Refresh Token é salvo no banco de dados e usado para verificações.
    Frontend armazena o token via flutter_secure_storage (SharedPreferences para web).
