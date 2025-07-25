import 'package:conectar_frontend/core/routing/routes.dart';
import 'package:conectar_frontend/ui/auth/viewmodel/auth_viewmodel.dart';
import 'package:conectar_frontend/ui/auth/widgets/login_form/login_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

final _authViewmodel = AuthViewmodel();

class LoginScreen extends StatefulWidget {
  const LoginScreen({
    super.key,
  });

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          width: 200,
          height: 100,
          child: SvgPicture.asset(
            'assets/images/logo.svg',
            colorFilter: const ColorFilter.mode(
              Colors.white,
              BlendMode.srcIn,
            ),
          ),
        ),
        SizedBox(
          width: 500,
          child: Card(
            child: LoginForm(
              onSubmit: (credentials) async {
                final isLoggedIn = await _authViewmodel.login(credentials);

                if (!context.mounted) {
                  return;
                }

                if (isLoggedIn) {
                  GoRouter.of(context).goNamed(Routes.home.name);
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text(
                        'Credenciais inválidas',
                      ),
                    ),
                  );
                }
              },
            ),
          ),
        )
      ],
    );
  }
}
