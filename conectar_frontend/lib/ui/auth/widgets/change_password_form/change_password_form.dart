import 'package:conectar_frontend/shared/widgets/custom_input.dart';
import 'package:conectar_frontend/ui/auth/widgets/change_password_form/change_password_form_controller.dart';
import 'package:flutter/material.dart';

class ChangePasswordForm extends StatefulWidget {
  const ChangePasswordForm({
    this.onSubmit,
    super.key,
  });

  final Future<void> Function(String newPassword)? onSubmit;

  @override
  State<ChangePasswordForm> createState() => _ChangePasswordFormState();
}

class _ChangePasswordFormState extends State<ChangePasswordForm> {
  final ctrl = ChangePasswordFormController();

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
                  FilledButton(
                    onPressed: () async {
                      final isValid = ctrl.validate();

                      if (!isValid) {
                        return;
                      }

                      final newPassword = ctrl.newPassword;

                      if (newPassword == null) {
                        return;
                      }

                      await widget.onSubmit?.call(newPassword);
                    },
                    child: const Text(
                      'Editar senha',
                    ),
                  ),
                ],
              ),
              CustomInput.password(
                labelText: 'Nova senha',
                onChanged: ctrl.setNewPassword,
                validator: (value) {
                  if (value == null || value == '') {
                    return 'Obrigatório';
                  }
                  return null;
                },
              ),
              CustomInput.password(
                labelText: 'Confirmar nova senha',
                onChanged: ctrl.setPasswordConfirmation,
                validator: (value) {
                  if (value == null || value == '') {
                    return 'Obrigatório';
                  }
                  if (value != ctrl.newPassword) {
                    return 'As senhas precisam ser iguais';
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
