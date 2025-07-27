import 'package:conectar_frontend/core/routing/routes.dart';
import 'package:conectar_frontend/ui/clients/viewmodel/clients_viewmodel.dart';
import 'package:conectar_frontend/ui/clients/widgets/client_form/client_form.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:skeletonizer/skeletonizer.dart';

class EditClientScreen extends StatefulWidget {
  const EditClientScreen({
    required this.clientId,
    super.key,
  });

  final int clientId;

  @override
  State<EditClientScreen> createState() => _EditClientScreenState();
}

class _EditClientScreenState extends State<EditClientScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final vm = context.read<ClientsViewmodel>();
      vm.findOne(widget.clientId);
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final viewmodel = context.read<ClientsViewmodel>();
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListenableBuilder(
            listenable: viewmodel,
            builder: (context, _) {
              return Skeletonizer(
                enabled: viewmodel.isLoading,
                child: ClientForm(
                  initialState: viewmodel.selectedClient,
                  onCancel: () async {
                    GoRouter.of(context).go(Routes.clients.path);
                  },
                  onSubmit: (client) async {
                    final clientId = client.id;

                    if (clientId == null) {
                      return;
                    }

                    final response = await viewmodel.update(clientId, client);

                    if (response?.id != null && context.mounted) {
                      GoRouter.of(context).go(Routes.clients.path);
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
