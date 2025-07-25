import 'package:conectar_frontend/core/routing/routes.dart';
import 'package:conectar_frontend/shared/widgets/custom_app_bar.dart';
import 'package:conectar_frontend/ui/auth/viewmodel/auth_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final _authViewmodel = AuthViewmodel();

class LoggedLayout extends StatelessWidget {
  const LoggedLayout({
    required this.child,
    super.key,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size(
          double.infinity,
          kToolbarHeight,
        ),
        child: CustomAppBar(
          onLogout: () async {
            final isLoggedOut = await _authViewmodel.logout();

            if (isLoggedOut && context.mounted) {
              GoRouter.of(context).goNamed(Routes.login.name);
            }
          },
        ),
      ),
      body: child,
    );
  }
}
