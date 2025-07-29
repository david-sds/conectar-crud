import 'package:conectar_frontend/shared/layouts/logged_layout.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final userTabs = [AppBarTabs.clients, AppBarTabs.profile];

class UserTabBar extends StatefulWidget {
  const UserTabBar({super.key});

  @override
  State<UserTabBar> createState() => UserTabBarState();
}

class UserTabBarState extends State<UserTabBar>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(
      length: userTabs.length,
      vsync: this,
    );

    final path =
        GoRouter.of(context).routerDelegate.currentConfiguration.fullPath;

    final index = userTabs.indexWhere((tab) => path.startsWith(tab.route.path));
    _tabController.index = index >= 0 ? index : 0;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TabBar(
      controller: _tabController,
      dividerColor: Colors.transparent,
      onTap: (index) {
        final tab = userTabs[index];
        GoRouter.of(context).pushNamed(tab.route.name);
      },
      isScrollable: true,
      tabs: userTabs
          .map((e) => SizedBox(
                width: 80,
                child: Tab(text: e.label),
              ))
          .toList(),
    );
  }
}
