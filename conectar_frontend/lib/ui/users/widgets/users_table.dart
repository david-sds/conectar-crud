import 'package:conectar_frontend/core/routing/routes.dart';
import 'package:conectar_frontend/domain/models/user/user_model.dart';
import 'package:conectar_frontend/domain/models/user_role/user_role_model.dart';
import 'package:conectar_frontend/shared/widgets/custom_pagination.dart';
import 'package:conectar_frontend/ui/users/viewmodel/users_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:skeletonizer/skeletonizer.dart';

final loadingUsers = List.generate(
  7,
  (_) => const User(
    email: '-------------',
    name: '----- ----- ------',
    role: UserRole.user,
  ),
);

class UsersTable extends StatelessWidget {
  const UsersTable({super.key});

  @override
  Widget build(BuildContext context) {
    final viewmodel = context.read<UsersViewmodel>();
    return ListenableBuilder(
      listenable: viewmodel,
      builder: (context, _) {
        final users = viewmodel.isLoading ? loadingUsers : viewmodel.users;

        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  OutlinedButton(
                    onPressed: () {
                      GoRouter.of(context).pushNamed(Routes.createUser.name);
                    },
                    style: OutlinedButton.styleFrom(
                      foregroundColor: Theme.of(context).colorScheme.onSurface,
                      side: BorderSide(
                        color: Theme.of(context).colorScheme.onSurface,
                      ),
                    ),
                    child: const Text('Novo'),
                  ),
                  const SizedBox(
                    width: 16,
                  )
                ],
              ),
            ),
            if (viewmodel.users.isEmpty && !viewmodel.isLoading)
              const ListTile(
                contentPadding: EdgeInsets.all(20),
                title: Text('Nenhum usuário registrado'),
                subtitle: Text(
                  'Registre um usuário clicando no '
                  'botão "novo" abaixo.',
                ),
                leading: Icon(
                  Icons.sentiment_dissatisfied,
                ),
              )
            else
              Skeletonizer(
                enabled: viewmodel.isLoading,
                child: LayoutBuilder(builder: (context, constraints) {
                  return SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: SizedBox(
                      width: constraints.maxWidth < 930
                          ? 930
                          : constraints.maxWidth,
                      child: DataTable(
                        showCheckboxColumn: false,
                        columns: const [
                          DataColumn(
                            label: Text('Nome'),
                          ),
                          DataColumn(
                            label: Text('Email'),
                          ),
                          DataColumn(
                            label: Text('Cargo'),
                          ),
                        ],
                        rows: List.generate(
                          users.length,
                          (index) {
                            final user = users[index];
                            return DataRow(
                              onSelectChanged: (_) {
                                final userId = user.id;
                                if (userId == null) {
                                  return;
                                }
                                GoRouter.of(context).pushNamed(
                                  Routes.users.detailName,
                                  pathParameters: {
                                    'id': userId.toString(),
                                  },
                                );
                              },
                              cells: [
                                DataCell(
                                  Text(user.name ?? '-'),
                                ),
                                DataCell(
                                  Text(user.email ?? '-'),
                                ),
                                DataCell(
                                  Text(user.role?.label ?? '-'),
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                    ),
                  );
                }),
              ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
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
                ],
              ),
            )
          ],
        );
      },
    );
  }
}
