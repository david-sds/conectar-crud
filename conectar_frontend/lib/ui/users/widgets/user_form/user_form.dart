import 'package:conectar_frontend/domain/models/user/user_model.dart';
import 'package:conectar_frontend/domain/models/user_role/user_role_model.dart';
import 'package:conectar_frontend/shared/widgets/custom_dropdown.dart';
import 'package:conectar_frontend/shared/widgets/custom_input.dart';
import 'package:conectar_frontend/ui/users/widgets/user_form/user_form_controller.dart';
import 'package:flutter/material.dart';
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

  @override
  void initState() {
    ctrl.initState(widget.initialState);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
            ],
          );
        },
      ),
    );
  }
}
