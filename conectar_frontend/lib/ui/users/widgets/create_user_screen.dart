import 'package:conectar_frontend/core/routing/routes.dart';
import 'package:conectar_frontend/ui/users/viewmodel/users_viewmodel.dart';
import 'package:conectar_frontend/ui/users/widgets/user_form/user_form.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class CreateUserScreen extends StatelessWidget {
  const CreateUserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final viewmodel = context.read<UsersViewmodel>();
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: UserForm(
            onCancel: () async {
              GoRouter.of(context).go(Routes.users.path);
            },
            onSubmit: (user) async {
              print(user);
              final response = await viewmodel.create(user);

              if (response?.id != null && context.mounted) {
                GoRouter.of(context).go(Routes.users.path);
              }
            },
          ),
        ),
      ],
    );
  }
}
