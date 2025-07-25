import 'package:conectar_frontend/data/repositories/users_repository.dart';
import 'package:conectar_frontend/domain/models/user/user_model.dart';
import 'package:flutter/material.dart';

final _usersRepository = UsersRepository();

class UsersViewmodel extends ChangeNotifier {
  List<User> _users = [];
  List<User> get users => _users;
  void setUsers(List<User> values) => _users = values;

  Future<void> load() async {
    try {
      await _usersRepository.findAll();
    } catch (e) {
      debugPrint('Error while loading UsersViewmode => $e');
    }
  }
}
