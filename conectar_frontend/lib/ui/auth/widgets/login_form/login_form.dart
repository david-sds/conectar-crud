import 'package:conectar_frontend/domain/models/credentials_model.dart';
import 'package:conectar_frontend/shared/widgets/custom_input.dart';
import 'package:conectar_frontend/ui/auth/widgets/login_form/login_form_controller.dart';
import 'package:flutter/material.dart';
import 'package:validators/validators.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({
    this.initialState,
    this.onSubmit,
    super.key,
  });

  final Credentials? initialState;
  final Future<void> Function(Credentials credentials)? onSubmit;

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final ctrl = LoginFormController();

  @override
  void initState() {
    ctrl.setEmail(widget.initialState?.email);
    ctrl.setPassword(widget.initialState?.password);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: ctrl.formKey,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CustomInput(
              labelText: 'Email',
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
            const SizedBox(
              height: 8,
            ),
            CustomInput.password(
              labelText: 'Senha',
              onChanged: ctrl.setPassword,
              validator: (value) {
                if (value == null || value == '') {
                  return 'Obrigatório';
                }
                return null;
              },
            ),
            const SizedBox(
              height: 8,
            ),
            FilledButton(
              child: const Text('Entrar'),
              onPressed: () async {
                final isValid = ctrl.formKey.currentState?.validate() ?? false;

                if (!isValid) {
                  return;
                }

                widget.onSubmit?.call(Credentials(
                  email: ctrl.email,
                  password: ctrl.password,
                ));
              },
            ),
          ],
        ),
      ),
    );
  }
}
