import 'package:flutter/material.dart';

class LoginFormController extends ChangeNotifier {
  final formKey = GlobalKey<FormState>();

  String? _email;
  String? get email => _email;
  void setEmail(String? value) {
    _email = value;
    notifyListeners();
  }

  String? _password;
  String? get password => _password;
  void setPassword(String? value) {
    _password = value;
    notifyListeners();
  }
}
