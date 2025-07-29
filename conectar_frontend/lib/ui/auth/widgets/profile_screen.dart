import 'package:conectar_frontend/domain/models/user_details/user_details_model.dart';
import 'package:conectar_frontend/domain/models/user_role/user_role_model.dart';
import 'package:conectar_frontend/ui/auth/viewmodel/auth_viewmodel.dart';
import 'package:conectar_frontend/ui/auth/widgets/change_password_form/change_password_form.dart';
import 'package:conectar_frontend/ui/auth/widgets/profile_info.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final vm = context.read<AuthViewmodel>();
      vm.findMe();
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final viewmodel = context.read<AuthViewmodel>();
    return Column(
      children: [
        Card(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const ListTile(
                title: Text('Perfil'),
                subtitle: Text('Vizualize as informações do seu perfil.'),
              ),
              ListenableBuilder(
                listenable: viewmodel,
                builder: (context, _) {
                  final userDetails = viewmodel.isLoading
                      ? UserDetails(
                          email: '---------------------',
                          name: '-------- --- ------',
                          createdAt: DateTime.now(),
                          role: UserRole.user,
                        )
                      : viewmodel.loggedUser;

                  if (userDetails == null) {
                    return const SizedBox.shrink();
                  }

                  return Skeletonizer(
                    enabled: viewmodel.isLoading,
                    child: ProfileInfo(
                      userDetails: userDetails,
                    ),
                  );
                },
              )
            ],
          ),
        ),
        Card(
          child: ExpansionTile(
            title: const Text('Mudar senha'),
            subtitle: const Text(
              'Escolha uma nova senha e a confirme.',
            ),
            children: [
              ListenableBuilder(
                listenable: viewmodel,
                builder: (context, _) {
                  return Skeletonizer(
                    enabled: viewmodel.isLoading,
                    child: ChangePasswordForm(
                      onSubmit: (newPasswored) async {
                        await viewmodel.changePassword(newPasswored);
                      },
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ],
    );
  }
}
