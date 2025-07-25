import 'package:conectar_frontend/core/routing/guards/guards.dart';
import 'package:conectar_frontend/core/routing/routes.dart';
import 'package:conectar_frontend/shared/layouts/logged_layout.dart';
import 'package:conectar_frontend/shared/layouts/not_logged_layout.dart';
import 'package:conectar_frontend/ui/auth/widgets/login_screen.dart';
import 'package:conectar_frontend/ui/clients/widgets/clients_screen.dart';
import 'package:conectar_frontend/ui/not_found_screen.dart';
import 'package:conectar_frontend/ui/users/widgets/users_screen.dart';
import 'package:go_router/go_router.dart';

final _guards = Guards();

final _loggedStack = ShellRoute(
  builder: (context, state, child) {
    return LoggedLayout(child: child);
  },
  routes: [
    GoRoute(
      path: Routes.users.path,
      name: Routes.users.name,
      redirect: _guards.authGuard.logged,
      builder: (context, state) {
        return const UsersScreen();
      },
    ),
    GoRoute(
      path: Routes.clients.path,
      name: Routes.clients.name,
      redirect: _guards.authGuard.logged,
      builder: (context, state) {
        return const ClientsScreen();
      },
    )
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

final router = GoRouter(
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
