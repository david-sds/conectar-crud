import 'package:conectar_frontend/core/routing/routes.dart';
import 'package:conectar_frontend/data/services/token_service.dart';
import 'package:conectar_frontend/shared/layouts/logged_layout.dart';
import 'package:conectar_frontend/shared/layouts/not_logged_layout.dart';
import 'package:conectar_frontend/ui/auth/widgets/login_screen.dart';
import 'package:conectar_frontend/ui/home/widgets/home_screen.dart';
import 'package:conectar_frontend/ui/not_found_screen.dart';
import 'package:go_router/go_router.dart';

final _tokenService = TokenService();

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
  routes: [
    GoRoute(
      path: Routes.initial.path,
      name: Routes.initial.name,
      redirect: (context, state) async {
        final accessToken = await _tokenService.getAccessToken();

        final isLoggedIn = accessToken != null;

        return isLoggedIn ? Routes.home.path : Routes.login.path;
      },
      routes: [
        _loggedStack,
        _notLoggedStack,
      ],
    ),
  ],
  errorBuilder: (context, state) => const LoggedLayout(
    child: NotFoundScreen(),
  ),
);
