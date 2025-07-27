import 'package:conectar_frontend/core/routing/routes.dart';
import 'package:conectar_frontend/ui/clients/viewmodel/clients_viewmodel.dart';
import 'package:conectar_frontend/ui/clients/widgets/client_form/client_form.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class CreateClientScreen extends StatelessWidget {
  const CreateClientScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final viewmodel = context.read<ClientsViewmodel>();
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: ClientForm(
            onCancel: () async {
              GoRouter.of(context).go(Routes.clients.path);
            },
            onSubmit: (client) async {
              final response = await viewmodel.create(client);

              if (response?.id != null && context.mounted) {
                GoRouter.of(context).go(Routes.clients.path);
              }
            },
          ),
        ),
      ],
    );
  }
}
