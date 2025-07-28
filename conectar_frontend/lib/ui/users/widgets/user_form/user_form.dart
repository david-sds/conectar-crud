import 'package:conectar_frontend/core/extensions/string_extension.dart';
import 'package:conectar_frontend/domain/models/client/client_model.dart';
import 'package:conectar_frontend/domain/models/user/user_model.dart';
import 'package:conectar_frontend/domain/models/user_role/user_role_model.dart';
import 'package:conectar_frontend/shared/widgets/custom_autocomplete.dart';
import 'package:conectar_frontend/shared/widgets/custom_dropdown.dart';
import 'package:conectar_frontend/shared/widgets/custom_input.dart';
import 'package:conectar_frontend/ui/clients/viewmodel/clients_viewmodel.dart';
import 'package:conectar_frontend/ui/users/widgets/user_form/user_form_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:validators/validators.dart';

class UserForm extends StatefulWidget {
  const UserForm({
    this.initialState,
    this.onSubmit,
    this.onCancel,
    super.key,
  });

  final User? initialState;
  final Future<void> Function(User user)? onSubmit;
  final Future<void> Function()? onCancel;

  @override
  State<UserForm> createState() => _UserFormState();
}

class _UserFormState extends State<UserForm> {
  final ctrl = UserFormController();
  final clientAutocompleteController = TextEditingController();

  @override
  void initState() {
    ctrl.initState(widget.initialState);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final clientViewmodel = context.read<ClientsViewmodel>();
    return Form(
      key: ctrl.formKey,
      child: ListenableBuilder(
        listenable: ctrl,
        builder: (context, _) {
          return Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  OutlinedButton(
                    onPressed: widget.onCancel,
                    child: const Text('Cancelar'),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  FilledButton(
                    onPressed: () async {
                      final isValid = ctrl.validate();
                      if (!isValid) {
                        return;
                      }

                      final user =
                          (widget.initialState ?? const User()).copyWith(
                        name: ctrl.name,
                        email: ctrl.email,
                        role: ctrl.role,
                      );

                      await widget.onSubmit?.call(user);
                    },
                    child: Text(
                      widget.initialState?.id == null
                          ? 'Criar usuário'
                          : 'Editar usuário',
                    ),
                  ),
                ],
              ),
              CustomInput(
                labelText: 'Nome',
                initialValue: ctrl.name,
                onChanged: ctrl.setName,
                validator: (value) {
                  if (value == null || value == '') {
                    return 'Obrigatório';
                  }

                  return null;
                },
              ),
              CustomInput(
                labelText: 'Email',
                initialValue: ctrl.email,
                onChanged: ctrl.setEmail,
                validator: (value) {
                  if (value == null || value == '') {
                    return 'Obrigatório';
                  }
                  if (!isEmail(value)) {
                    return 'Email inválido';
                  }
                  return null;
                },
              ),
              CustomDropdown<UserRole?>(
                labelText: 'Cargo',
                itemLabel: (value) => value?.label,
                items: UserRole.values,
                onChanged: ctrl.setRole,
                value: ctrl.role,
                validator: (value) {
                  if (value == null) {
                    return 'Obrigatório';
                  }
                  return null;
                },
              ),
              CustomAutocomplete<Client>(
                textEditingController: clientAutocompleteController,
                debounceMs: 500,
                onItemTitle: (value) => value.name ?? '-',
                onItemSubtitle: (value) =>
                    value.cnpj?.mask('##.###.###/####-##') ?? '-',
                onSearch: (search) async {
                  final clients = await clientViewmodel.search(search);

                  return clients;
                },
                onSelected: (value) {
                  if (!ctrl.selectedClients.any((e) => e.id == value.id)) {
                    ctrl.setSelectedClients([...ctrl.selectedClients, value]);
                    clientAutocompleteController.value = TextEditingValue.empty;
                  }
                },
              ),
              ...List.generate(ctrl.selectedClients.length, (index) {
                final client = ctrl.selectedClients[index];
                return ListTile(
                  title: Text(client.name ?? '-'),
                  subtitle: Text(
                    client.cnpj?.mask('##.###.###/####-##') ?? '-',
                  ),
                  leading: IconButton(
                    tooltip: 'Remover cliente',
                    onPressed: () {
                      ctrl.setSelectedClients(
                        ctrl.selectedClients
                            .where((e) => e.id != client.id)
                            .toList(),
                      );
                    },
                    icon: const Icon(Icons.close),
                  ),
                );
              })
            ],
          );
        },
      ),
    );
  }
}
