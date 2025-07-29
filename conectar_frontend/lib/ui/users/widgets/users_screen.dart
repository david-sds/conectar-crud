import 'package:conectar_frontend/domain/models/user_role/user_role_model.dart';
import 'package:conectar_frontend/shared/widgets/custom_dropdown.dart';
import 'package:conectar_frontend/shared/widgets/custom_input.dart';
import 'package:conectar_frontend/ui/users/viewmodel/users_viewmodel.dart';
import 'package:conectar_frontend/ui/users/widgets/users_table.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UsersScreen extends StatefulWidget {
  const UsersScreen({super.key});

  @override
  State<UsersScreen> createState() => _UsersScreenState();
}

class _UsersScreenState extends State<UsersScreen> {
  final _nomeController = TextEditingController();
  final _emailController = TextEditingController();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final vm = context.read<UsersViewmodel>();
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
    final viewmodel = context.read<UsersViewmodel>();
    final isHorizontalFilters = MediaQuery.sizeOf(context).width > 700;

    return Column(
      children: [
        Card(
          child: ExpansionTile(
            leading: const Icon(
              Icons.search,
            ),
            title: const Text('Filtros'),
            subtitle: const Text(
              'Filtre ou busque itens na página.',
            ),
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
                            controller: _emailController,
                            labelText: 'Buscar por email',
                            onChanged: viewmodel.setEmailFilter,
                          ),
                        ),
                        const SizedBox(width: 8),
                        _flexWrapper(
                          isHorizontalFilters,
                          CustomDropdown<UserRole?>(
                            labelText: 'Buscar por cargo',
                            itemLabel: (value) => value?.label,
                            items: UserRole.values,
                            onChanged: viewmodel.setRoleFilter,
                            value: viewmodel.roleFilter,
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
                        _emailController.clear();
                      }
                    },
                    child: const Text('Limpar campos'),
                  ),
                  const SizedBox(width: 16),
                  FilledButton(
                    onPressed: viewmodel.applyFilters,
                    child: const Text('Filtrar'),
                  ),
                ],
              ),
            ],
          ),
        ),
        const Card(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ListTile(
                title: Text('Usuários'),
                subtitle: Text(
                  'Selecione um usuário para editar suas informaçôes.',
                ),
              ),
              UsersTable(),
            ],
          ),
        ),
      ],
    );
  }
}
