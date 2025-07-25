import 'package:conectar_frontend/app/app.dart';
import 'package:conectar_frontend/shared/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: providers,
    child: const App(),
  ));
}
