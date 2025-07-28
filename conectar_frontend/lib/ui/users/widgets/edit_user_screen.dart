import 'package:conectar_frontend/core/routing/routes.dart';
import 'package:conectar_frontend/ui/users/viewmodel/users_viewmodel.dart';
import 'package:conectar_frontend/ui/users/widgets/user_form/user_form.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:skeletonizer/skeletonizer.dart';

class EditUserScreen extends StatefulWidget {
  const EditUserScreen({
    required this.userId,
    super.key,
  });

  final int userId;

  @override
  State<EditUserScreen> createState() => _EditUserScreenState();
}

class _EditUserScreenState extends State<EditUserScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final vm = context.read<UsersViewmodel>();
      vm.findOne(widget.userId);
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final viewmodel = context.read<UsersViewmodel>();
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListenableBuilder(
            listenable: viewmodel,
            builder: (context, _) {
              return Skeletonizer(
                enabled: viewmodel.isLoading,
                child: UserForm(
                  initialState: viewmodel.selectedUser,
                  onCancel: () async {
                    GoRouter.of(context).go(Routes.users.path);
                  },
                  onSubmit: (user) async {
                    final userId = user.id;

                    if (userId == null) {
                      return;
                    }

                    final response = await viewmodel.update(userId, user);

                    if (response?.id != null && context.mounted) {
                      GoRouter.of(context).go(Routes.users.path);
                    }
                  },
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
