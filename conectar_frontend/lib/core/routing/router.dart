import 'package:conectar_frontend/core/routing/guards/guards.dart';
import 'package:conectar_frontend/core/routing/routes.dart';
import 'package:conectar_frontend/shared/layouts/logged_layout.dart';
import 'package:conectar_frontend/shared/layouts/not_logged_layout.dart';
import 'package:conectar_frontend/ui/auth/widgets/login_screen.dart';
import 'package:conectar_frontend/ui/clients/widgets/clients_screen.dart';
import 'package:conectar_frontend/ui/clients/widgets/create_client_screen.dart';
import 'package:conectar_frontend/ui/clients/widgets/edit_client_screen.dart';
import 'package:conectar_frontend/ui/not_found_screen.dart';
import 'package:conectar_frontend/ui/users/widgets/users_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final _guards = Guards();

final _loggedStack = ShellRoute(
  builder: (context, state, child) {
    return LoggedLayout(child: child);
  },
  routes: [
    GoRoute(
      path: Routes.clients.path,
      name: Routes.clients.name,
      redirect: _guards.authGuard.logged,
      builder: (context, state) {
        return const ClientsScreen();
      },
    ),
    GoRoute(
      path: Routes.createClient.path,
      name: Routes.createClient.name,
      redirect: _guards.authGuard.logged,
      builder: (context, state) {
        return const CreateClientScreen();
      },
    ),
    GoRoute(
      path: Routes.clients.detailPath,
      name: Routes.clients.detailName,
      redirect: _guards.authGuard.logged,
      builder: (context, state) {
        final clientId = int.tryParse(state.pathParameters['id'] ?? '');
        if (clientId == null) {
          return const NotFoundScreen();
        }
        return EditClientScreen(
          clientId: clientId,
        );
      },
    ),
    GoRoute(
      path: Routes.users.path,
      name: Routes.users.name,
      redirect: _guards.authGuard.logged,
      builder: (context, state) {
        return const UsersScreen();
      },
    ),
  ],
);

final _notLoggedStack = ShellRoute(
  builder: (context, state, child) {
    return NotLoggedLayout(child: child);
  },
  routes: [
    GoRoute(
      path: Routes.login.path,
      name: Routes.login.name,
      redirect: _guards.authGuard.notLogged,
      builder: (context, state) {
        return const LoginScreen();
      },
    )
  ],
);

GoRouter createRouter(BuildContext context) {
  return GoRouter(
    routes: [
      GoRoute(
        name: Routes.initial.name,
        path: Routes.initial.path,
        redirect: (context, state) => Routes.clients.path,
      ),
      _loggedStack,
      _notLoggedStack,
    ],
    errorBuilder: (context, state) => const LoggedLayout(
      child: NotFoundScreen(),
    ),
  );
}
