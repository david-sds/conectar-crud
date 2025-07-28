import 'package:conectar_frontend/core/routing/routes.dart';
import 'package:conectar_frontend/domain/models/user_role/user_role_model.dart';
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

final adminTabs = [AppBarTabs.clients, AppBarTabs.users, AppBarTabs.profile];
final userTabs = [AppBarTabs.clients, AppBarTabs.profile];

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
  late List<AppBarTabs> tabs;
  late TabController _tabController;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _initTabs();
  }

  Future<void> _initTabs() async {
    final vm = context.read<AuthViewmodel>();
    final loggedUser = await vm.findMe();

    if (!mounted) return;

    tabs = loggedUser?.role == UserRole.admin ? adminTabs : userTabs;

    _tabController = TabController(
      length: tabs.length,
      vsync: this,
    );

    final path =
        GoRouter.of(context).routerDelegate.currentConfiguration.fullPath;

    final index = tabs.indexWhere((tab) => path.startsWith(tab.route.path));
    _tabController.index = index >= 0 ? index : 0;

    setState(() {
      isLoading = false;
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authViewmodel = context.read<AuthViewmodel>();

    if (isLoading) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size(double.infinity, kToolbarHeight),
        child: CustomAppBar(
          tabBar: TabBar(
            controller: _tabController,
            dividerColor: Colors.transparent,
            onTap: (index) {
              final tab = tabs[index];
              GoRouter.of(context).pushNamed(tab.route.name);
            },
            tabs: tabs.map((e) => Tab(text: e.label)).toList(),
          ),
          onLogout: () async {
            final isLoggedOut = await authViewmodel.logout();
            if (isLoggedOut && context.mounted) {
              GoRouter.of(context).goNamed(Routes.login.name);
            }
          },
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(child: widget.child),
          ),
        ],
      ),
    );
  }
}
