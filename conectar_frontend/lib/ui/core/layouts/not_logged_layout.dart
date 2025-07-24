import 'package:flutter/material.dart';

class NotLoggedLayout extends StatelessWidget {
  const NotLoggedLayout({
    required this.child,
    super.key,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: child,
    );
  }
}
