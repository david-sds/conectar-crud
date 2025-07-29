import 'package:conectar_frontend/domain/models/client_status/client_status_model.dart';
import 'package:conectar_frontend/shared/widgets/custom_dropdown.dart';
import 'package:conectar_frontend/shared/widgets/custom_input.dart';
import 'package:conectar_frontend/ui/clients/viewmodel/clients_viewmodel.dart';
import 'package:conectar_frontend/ui/clients/widgets/clients_table.dart';
import 'package:flutter/material.dart';
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

  Widget _flexWrapper(bool isHorizontal, Widget child) {
    return isHorizontal
        ? Flexible(child: child)
        : Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: child,
          );
  }

  @override
  Widget build(BuildContext context) {
    final viewmodel = context.read<ClientsViewmodel>();
    final isHorizontalFilters = MediaQuery.sizeOf(context).width > 700;
    return Column(
      children: [
        Card(
          child: ExpansionTile(
            leading: const Icon(
              Icons.search,
            ),
            title: const Text(
              'Filtros',
            ),
            subtitle: const Text('Filtre ou busque itens na página.'),
            children: [
              ListenableBuilder(
                  listenable: viewmodel,
                  builder: (context, widget) {
                    return Flex(
                      direction:
                          isHorizontalFilters ? Axis.horizontal : Axis.vertical,
                      children: [
                        _flexWrapper(
                          isHorizontalFilters,
                          CustomInput(
                            controller: _nomeController,
                            labelText: 'Buscar por nome',
                            onChanged: viewmodel.setNameFilter,
                          ),
                        ),
                        const SizedBox(width: 8),
                        _flexWrapper(
                          isHorizontalFilters,
                          CustomInput(
                            controller: _cnpjController,
                            labelText: 'Buscar por CNPJ',
                            onChanged: viewmodel.setCnpjFilter,
                          ),
                        ),
                        const SizedBox(width: 8),
                        _flexWrapper(
                          isHorizontalFilters,
                          CustomDropdown<ClientStatus?>(
                            labelText: 'Buscar por status',
                            itemLabel: (value) => value?.label,
                            items: ClientStatus.values,
                            onChanged: viewmodel.setStatusFilter,
                            value: viewmodel.statusFilter,
                          ),
                        ),
                        const SizedBox(width: 8),
                        _flexWrapper(
                          isHorizontalFilters,
                          CustomDropdown<bool>(
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
                  SizedBox(
                    width: 140,
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(padding: EdgeInsets.zero),
                      onPressed: () async {
                        final success = await viewmodel.resetFilters();

                        if (success) {
                          _nomeController.clear();
                          _cnpjController.clear();
                        }
                      },
                      child: const Text('Limpar campos'),
                    ),
                  ),
                  const SizedBox(width: 16),
                  SizedBox(
                    width: 140,
                    child: FilledButton(
                      style: FilledButton.styleFrom(padding: EdgeInsets.zero),
                      onPressed: viewmodel.applyFilters,
                      child: const Text('Filtrar'),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 12,
        ),
        const Card(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ListTile(
                title: Text(
                  'Clientes',
                ),
                subtitle: Text(
                  'Selecione um cliente para editar suas informaçôes.',
                ),
              ),
              ClientsTable(),
            ],
          ),
        ),
      ],
    );
  }
}
