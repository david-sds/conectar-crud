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
              const Row(
                children: [
                  Flexible(
                    child: CustomInput(
                      labelText: 'Buscar por nome',
                    ),
                  ),
                  SizedBox(width: 8),
                  Flexible(
                    child: CustomInput(
                      labelText: 'Buscar por CNPJ',
                    ),
                  ),
                  SizedBox(width: 8),
                  Flexible(
                    child: CustomInput(
                      labelText: 'Buscar por status',
                    ),
                  ),
                  SizedBox(width: 8),
                  Flexible(
                    child: CustomInput(
                      labelText: 'Buscar por conectar+',
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  OutlinedButton(
                    onPressed: () {},
                    child: const Text('Limpar campos'),
                  ),
                  FilledButton(
                    onPressed: () {},
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
                      rows: const [], //_viewmodel.clients.map((client) => ),
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
