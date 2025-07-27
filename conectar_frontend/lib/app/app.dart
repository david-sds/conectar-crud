import 'package:conectar_frontend/core/routing/router.dart';
import 'package:conectar_frontend/core/themes/themes.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    final router = createRouter(context);

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: router,
      title: 'Conéctar',
      theme: Themes.light(),
      darkTheme: Themes.dark(),
      themeMode: ThemeMode.light,
    );
  }
}
