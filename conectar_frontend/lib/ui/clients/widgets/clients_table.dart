import 'package:conectar_frontend/core/extensions/string_extension.dart';
import 'package:conectar_frontend/core/routing/routes.dart';
import 'package:conectar_frontend/domain/models/address/address_model.dart';
import 'package:conectar_frontend/domain/models/client/client_model.dart';
import 'package:conectar_frontend/domain/models/client_status/client_status_model.dart';
import 'package:conectar_frontend/ui/clients/viewmodel/clients_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:skeletonizer/skeletonizer.dart';

final loadingClients = List.generate(
  7,
  (_) => const Client(
    legalName: '------',
    cnpj: '------------------',
    conectaPlus: true,
    name: '---------',
    status: ClientStatus.active,
    address: Address(
      city: '------',
      complement: '-----',
      country: '-------',
      district: '-----',
      state: '-----',
      number: '--',
      street: '-------- -- --------',
      zipCode: '---------',
    ),
  ),
);

class ClientsTable extends StatelessWidget {
  const ClientsTable({super.key});

  @override
  Widget build(BuildContext context) {
    final viewmodel = context.read<ClientsViewmodel>();
    return ListenableBuilder(
      listenable: viewmodel,
      builder: (context, _) {
        final clients =
            viewmodel.isLoading ? loadingClients : viewmodel.clients;
        if (viewmodel.clients.isEmpty && !viewmodel.isLoading) {
          return const ListTile(
            contentPadding: EdgeInsets.all(20),
            title: Text('Nenhum cliente registrado'),
            subtitle: Text(
              'Registre um cliente clicando no '
              'botão "novo" abaixo.',
            ),
            leading: Icon(
              Icons.sentiment_dissatisfied,
            ),
          );
        }

        return Skeletonizer(
          enabled: viewmodel.isLoading,
          child: LayoutBuilder(builder: (context, constraints) {
            return SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: SizedBox(
                width: constraints.maxWidth < 600 ? 600 : constraints.maxWidth,
                child: DataTable(
                  showCheckboxColumn: false,
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
                    clients.length,
                    (index) {
                      final client = clients[index];
                      return DataRow(
                        onSelectChanged: (_) {
                          final clientId = client.id;
                          if (clientId == null) {
                            return;
                          }
                          GoRouter.of(context).pushNamed(
                            Routes.clients.detailName,
                            pathParameters: {
                              'id': clientId.toString(),
                            },
                          );
                        },
                        cells: [
                          DataCell(
                            Text(client.name ?? '-'),
                          ),
                          DataCell(
                            Text(
                              client.cnpj?.mask('##.###.###/####-##') ?? '-',
                            ),
                          ),
                          DataCell(
                            Text(client.legalName ?? '-'),
                          ),
                          const DataCell(
                            Text('-'),
                          ),
                          DataCell(
                            Text(client.status?.label ?? '-'),
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
                ),
              ),
            );
          }),
        );
      },
    );
  }
}
