import 'package:conectar_frontend/domain/models/client_status/client_status_model.dart';
import 'package:conectar_frontend/shared/widgets/custom_dropdown.dart';
import 'package:conectar_frontend/shared/widgets/custom_input.dart';
import 'package:conectar_frontend/ui/clients/viewmodel/clients_viewmodel.dart';
import 'package:flutter/material.dart';

class ClientsScreen extends StatefulWidget {
  const ClientsScreen({super.key});

  @override
  State<ClientsScreen> createState() => _ClientsScreenState();
}

class _ClientsScreenState extends State<ClientsScreen> {
  final _viewmodel = ClientsViewmodel();

  final _nomeController = TextEditingController();
  final _cnpjController = TextEditingController();

  @override
  void initState() {
    _viewmodel.load();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          child: ExpansionTile(
            title: const Text('Filtros'),
            subtitle: const Text('Filtre ou busque itens na página.'),
            children: [
              ListenableBuilder(
                  listenable: _viewmodel,
                  builder: (context, widget) {
                    return Row(
                      children: [
                        Flexible(
                          child: CustomInput(
                            controller: _nomeController,
                            labelText: 'Buscar por nome',
                            onChanged: _viewmodel.setNameFilter,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Flexible(
                          child: CustomInput(
                            controller: _cnpjController,
                            labelText: 'Buscar por CNPJ',
                            onChanged: _viewmodel.setCnpjFilter,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Flexible(
                          child: CustomDropdown<ClientStatus?>(
                            labelText: 'Buscar por status',
                            itemLabel: (value) => value?.label,
                            items: ClientStatus.values,
                            onChanged: _viewmodel.setStatusFilter,
                            value: _viewmodel.statusFilter,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Flexible(
                          child: CustomDropdown<bool>(
                            labelText: 'Buscar por conectar+',
                            itemLabel: (value) =>
                                value ? 'Possúi' : 'Não possúi',
                            items: const [true, false],
                            onChanged: _viewmodel.setConectarPlusFilter,
                            value: _viewmodel.conectarPlusFilter,
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
                      final success = await _viewmodel.resetFilters();

                      if (success) {
                        _nomeController.clear();
                        _cnpjController.clear();
                      }
                    },
                    child: const Text('Limpar campos'),
                  ),
                  FilledButton(
                    onPressed: _viewmodel.applyFilters,
                    child: const Text('Filtrar'),
                  ),
                ],
              ),
            ],
          ),
        ),
        Card(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const ListTile(
                title: Text('Clientes'),
                subtitle: Text(
                  'Selecione um usuário para editar suas informaçôes.',
                ),
              ),
              OutlinedButton(
                onPressed: () {},
                child: const Text('Novo'),
              ),
              SizedBox(
                width: double.infinity,
                child: ListenableBuilder(
                  listenable: _viewmodel,
                  builder: (context, widget) {
                    return DataTable(
                      columns: const [
                        DataColumn(
                          label: Text('Razao social'),
                        ),
                        DataColumn(
                          label: Text('CNPJ'),
                        ),
                        DataColumn(
                          label: Text('Nome na fachada'),
                        ),
                        DataColumn(
                          label: Text('Tags'),
                        ),
                        DataColumn(
                          label: Text('Status'),
                        ),
                        DataColumn(
                          label: Text('Conecta Plus'),
                        ),
                      ],
                      rows: List.generate(
                        _viewmodel.clients.length,
                        (index) {
                          final client = _viewmodel.clients[index];
                          return DataRow(
                            cells: [
                              DataCell(
                                Text(client.name ?? '-'),
                              ),
                              DataCell(
                                Text(client.cnpj ?? '-'),
                              ),
                              DataCell(
                                Text(client.legalName ?? '-'),
                              ),
                              const DataCell(
                                Text('-'),
                              ),
                              DataCell(
                                Text(client.status ?? '-'),
                              ),
                              DataCell(
                                Text(
                                  (client.conectaPlus ?? false) ? 'Sim' : 'Não',
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
