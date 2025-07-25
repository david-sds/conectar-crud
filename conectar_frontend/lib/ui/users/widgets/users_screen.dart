import 'package:conectar_frontend/ui/users/viewmodel/users_viewmodel.dart';
import 'package:flutter/material.dart';

class UsersScreen extends StatefulWidget {
  const UsersScreen({super.key});

  @override
  State<UsersScreen> createState() => _UsersScreenState();
}

class _UsersScreenState extends State<UsersScreen> {
  final _viewmodel = UsersViewmodel();

  @override
  void initState() {
    _viewmodel.load();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Text('users screen'),
      ],
    );
  }
}
