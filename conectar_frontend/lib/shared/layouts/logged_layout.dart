import 'package:conectar_frontend/core/routing/routes.dart';
import 'package:conectar_frontend/shared/widgets/custom_app_bar.dart';
import 'package:conectar_frontend/ui/auth/viewmodel/auth_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final _authViewmodel = AuthViewmodel();

enum AppBarTabs {
  users(
    label: 'Usuarios',
    route: Routes.users,
  ),
  clients(
    label: 'Clientes',
    route: Routes.clients,
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

class _LoggedLayoutState extends State<LoggedLayout>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(
      length: AppBarTabs.values.length,
      vsync: this,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size(
          double.infinity,
          kToolbarHeight,
        ),
        child: CustomAppBar(
          tabBar: TabBar(
            dividerColor: Colors.transparent,
            onTap: (index) {
              final tab = AppBarTabs.values[index];
              GoRouter.of(context).pushNamed(tab.route.name);
            },
            controller: _tabController,
            tabs: AppBarTabs.values.map((e) => Tab(text: e.label)).toList(),
          ),
          onLogout: () async {
            final isLoggedOut = await _authViewmodel.logout();

            if (isLoggedOut && context.mounted) {
              GoRouter.of(context).goNamed(Routes.login.name);
            }
          },
        ),
      ),
      body: widget.child,
    );
  }
}
