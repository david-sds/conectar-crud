import 'package:conectar_frontend/core/routing/routes.dart';
import 'package:conectar_frontend/data/services/token_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

final _tokenService = TokenService();

class AuthGuard {
  Future<String?> logged(BuildContext context, GoRouterState state) async {
    final isAccessToken = await _tokenService.isAccessToken();
    return isAccessToken ? null : Routes.login.path;
  }

  Future<String?> notLogged(BuildContext context, GoRouterState state) async {
    final isAccessToken = await _tokenService.isAccessToken();
    return !isAccessToken ? null : Routes.clients.path;
  }
}
