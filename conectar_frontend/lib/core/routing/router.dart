import 'package:conectar_frontend/core/routing/routes.dart';
import 'package:conectar_frontend/ui/auth/widgets/home_screen.dart';
import 'package:conectar_frontend/ui/auth/widgets/login_screen.dart';
import 'package:conectar_frontend/ui/core/layouts/logged_layout.dart';
import 'package:conectar_frontend/ui/core/layouts/not_logged_layout.dart';
import 'package:conectar_frontend/ui/core/not_found_screen.dart';
import 'package:go_router/go_router.dart';

final _loggedStack = ShellRoute(
  builder: (context, state, child) {
    return LoggedLayout(child: child);
  },
  routes: [
    GoRoute(
      path: Routes.home.path,
      name: Routes.home.name,
      builder: (context, state) {
        return const HomeScreen();
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
      builder: (context, state) {
        return const LoginScreen();
      },
    )
  ],
);

final router = GoRouter(
  redirect: (context, state) {
    return null;

    // false ? Routes.home.path : Routes.login.path
    // return Routes.login.path;
  },
  routes: [
    _loggedStack,
    _notLoggedStack,
  ],
  errorBuilder: (context, state) => const LoggedLayout(
    child: NotFoundScreen(),
  ),
);
