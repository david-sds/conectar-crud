import 'package:conectar_frontend/shared/layouts/logged_layout.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final adminTabs = [AppBarTabs.clients, AppBarTabs.users, AppBarTabs.profile];

class AdminTabBar extends StatefulWidget {
  const AdminTabBar({super.key});

  @override
  State<AdminTabBar> createState() => AdminTabBarState();
}

class AdminTabBarState extends State<AdminTabBar>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(
      length: adminTabs.length,
      vsync: this,
    );

    final path =
        GoRouter.of(context).routerDelegate.currentConfiguration.fullPath;

    final index =
        adminTabs.indexWhere((tab) => path.startsWith(tab.route.path));
    _tabController.index = index >= 0 ? index : 0;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TabBar(
      controller: _tabController,
      dividerColor: Colors.transparent,
      onTap: (index) {
        final tab = adminTabs[index];
        GoRouter.of(context).pushNamed(tab.route.name);
      },
      isScrollable: true,
      tabs: adminTabs
          .map((e) => SizedBox(
                width: 80,
                child: Tab(text: e.label),
              ))
          .toList(),
    );
  }
}
