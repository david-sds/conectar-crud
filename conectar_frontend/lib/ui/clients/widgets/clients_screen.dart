import 'package:conectar_frontend/core/routing/routes.dart';
import 'package:conectar_frontend/domain/models/client_status/client_status_model.dart';
import 'package:conectar_frontend/shared/widgets/custom_dropdown.dart';
import 'package:conectar_frontend/shared/widgets/custom_input.dart';
import 'package:conectar_frontend/shared/widgets/custom_pagination.dart';
import 'package:conectar_frontend/ui/clients/viewmodel/clients_viewmodel.dart';
import 'package:conectar_frontend/ui/clients/widgets/clients_table.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class ClientsScreen extends StatefulWidget {
  const ClientsScreen({super.key});

  @override
  State<ClientsScreen> createState() => _ClientsScreenState();
}

class _ClientsScreenState extends State<ClientsScreen> {
  final _nomeController = TextEditingController();
  final _cnpjController = TextEditingController();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final vm = context.read<ClientsViewmodel>();
      vm.load();
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final viewmodel = context.read<ClientsViewmodel>();
    return Column(
      children: [
        Card(
          child: ExpansionTile(
            title: const Text('Filtros'),
            subtitle: const Text('Filtre ou busque itens na página.'),
            children: [
              ListenableBuilder(
                  listenable: viewmodel,
                  builder: (context, widget) {
                    return Row(
                      children: [
                        Flexible(
                          child: CustomInput(
                            controller: _nomeController,
                            labelText: 'Buscar por nome',
                            onChanged: viewmodel.setNameFilter,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Flexible(
                          child: CustomInput(
                            controller: _cnpjController,
                            labelText: 'Buscar por CNPJ',
                            onChanged: viewmodel.setCnpjFilter,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Flexible(
                          child: CustomDropdown<ClientStatus?>(
                            labelText: 'Buscar por status',
                            itemLabel: (value) => value?.label,
                            items: ClientStatus.values,
                            onChanged: viewmodel.setStatusFilter,
                            value: viewmodel.statusFilter,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Flexible(
                          child: CustomDropdown<bool>(
                            labelText: 'Buscar por conectar+',
                            itemLabel: (value) =>
                                value ? 'Possúi' : 'Não possúi',
                            items: const [true, false],
                            onChanged: viewmodel.setConectarPlusFilter,
                            value: viewmodel.conectarPlusFilter,
                          ),
                        ),
                      ],
                    );
                  }),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  OutlinedButton(
                    onPressed: () async {
                      final success = await viewmodel.resetFilters();

                      if (success) {
                        _nomeController.clear();
                        _cnpjController.clear();
                      }
                    },
                    child: const Text('Limpar campos'),
                  ),
                  FilledButton(
                    onPressed: viewmodel.applyFilters,
                    child: const Text('Filtrar'),
                  ),
                ],
              ),
            ],
          ),
        ),
        Card(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const ListTile(
                title: Text('Clientes'),
                subtitle: Text(
                  'Selecione um usuário para editar suas informaçôes.',
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ListenableBuilder(
                    listenable: viewmodel,
                    builder: (context, widget) {
                      return CustomPagination(
                        paginationOutput: viewmodel.paginationOutput,
                        onChangePage: (pageNumber) async {
                          await viewmodel.changePage(pageNumber);
                        },
                      );
                    },
                  ),
                  OutlinedButton(
                    onPressed: () {
                      GoRouter.of(context).pushNamed(Routes.createClient.name);
                    },
                    child: const Text('Novo'),
                  ),
                ],
              ),
              const ClientsTable(),
            ],
          ),
        ),
      ],
    );
  }
}
