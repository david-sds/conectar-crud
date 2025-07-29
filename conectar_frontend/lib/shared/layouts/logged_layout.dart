import 'package:conectar_frontend/core/routing/routes.dart';
import 'package:conectar_frontend/domain/models/user_role/user_role_model.dart';
import 'package:conectar_frontend/shared/layouts/admin_tab_bar.dart';
import 'package:conectar_frontend/shared/layouts/user_tab_bar.dart';
import 'package:conectar_frontend/shared/widgets/custom_app_bar.dart';
import 'package:conectar_frontend/ui/auth/viewmodel/auth_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

enum AppBarTabs {
  clients(
    label: 'Clientes',
    route: Routes.clients,
  ),
  users(
    label: 'Usuarios',
    route: Routes.users,
  ),
  profile(
    label: 'Perfil',
    route: Routes.profile,
  );

  const AppBarTabs({
    required this.label,
    required this.route,
  });

  final String label;
  final Routes route;
}

class LoggedLayout extends StatefulWidget {
  const LoggedLayout({
    required this.child,
    super.key,
  });

  final Widget child;

  @override
  State<LoggedLayout> createState() => _LoggedLayoutState();
}

class _LoggedLayoutState extends State<LoggedLayout> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final vm = context.read<AuthViewmodel>();
      vm.loadTokenDecode();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final authViewmodel = context.read<AuthViewmodel>();

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size(double.infinity, kToolbarHeight),
        child: ListenableBuilder(
            listenable: authViewmodel,
            builder: (context, _) {
              return CustomAppBar(
                tabBar: authViewmodel.tokenDecode?.role == UserRole.admin
                    ? const AdminTabBar()
                    : const UserTabBar(),
                onLogout: () async {
                  final isLoggedOut = await authViewmodel.logout();
                  if (isLoggedOut && context.mounted) {
                    GoRouter.of(context).goNamed(Routes.login.name);
                  }
                },
              );
            }),
      ),
      body: Container(
        color: Theme.of(context).colorScheme.surface,
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(
                  24,
                ),
                child: widget.child,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
