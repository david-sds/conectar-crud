import 'package:conectar_frontend/app/app.dart';
import 'package:conectar_frontend/shared/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:url_strategy/url_strategy.dart';

void main() {
  setPathUrlStrategy();
  GoRouter.optionURLReflectsImperativeAPIs = true;

  runApp(MultiProvider(
    providers: providers,
    child: const App(),
  ));
}
