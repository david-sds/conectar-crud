import 'package:flutter/material.dart';

class ChangePasswordFormController extends ChangeNotifier {
  final formKey = GlobalKey<FormState>();

  String? _newPassword;
  String? get newPassword => _newPassword;
  setNewPassword(String? value) {
    _newPassword = value;
    notifyListeners();
  }

  String? _newPasswordConfirmation;
  String? get newPasswordConfirmation => _newPasswordConfirmation;
  setPasswordConfirmation(String? value) {
    _newPasswordConfirmation = value;
    notifyListeners();
  }

  bool validate() {
    final isValid = formKey.currentState?.validate() ?? false;

    return isValid;
  }
}
