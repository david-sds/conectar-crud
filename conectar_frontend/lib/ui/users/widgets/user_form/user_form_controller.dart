import 'package:conectar_frontend/domain/models/user/user_model.dart';
import 'package:conectar_frontend/domain/models/user_role/user_role_model.dart';
import 'package:flutter/material.dart';

class UserFormController extends ChangeNotifier {
  final formKey = GlobalKey<FormState>();

  String? _name;
  String? get name => _name;
  setName(String? value) {
    _name = value;
    notifyListeners();
  }

  String? _email;
  String? get email => _email;
  setEmail(String? value) {
    _email = value;
    notifyListeners();
  }

  UserRole? _role;
  UserRole? get role => _role;
  setRole(UserRole? value) {
    _role = value;
    notifyListeners();
  }

  void initState(User? initialState) {
    _name = initialState?.name;
    _email = initialState?.email;
    _role = initialState?.role;
    notifyListeners();
  }

  bool validate() {
    final isValid = formKey.currentState?.validate() ?? false;

    return isValid;
  }
}
