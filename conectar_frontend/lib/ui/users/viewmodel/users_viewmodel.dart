import 'package:collection/collection.dart';
import 'package:conectar_frontend/data/repositories/users_repository.dart';
import 'package:conectar_frontend/domain/models/filters/user_filters/user_filters_model.dart';
import 'package:conectar_frontend/domain/models/user/user_model.dart';
import 'package:conectar_frontend/domain/models/user_details/user_details_model.dart';
import 'package:conectar_frontend/domain/models/user_role/user_role_model.dart';
import 'package:conectar_frontend/shared/models/pagination/pagination_input/pagination_input_model.dart';
import 'package:conectar_frontend/shared/models/pagination/pagination_output/pagination_output_model.dart';
import 'package:flutter/material.dart';

class UsersViewmodel extends ChangeNotifier {
  UsersViewmodel({
    required UsersRepository usersRepository,
  }) : _usersRepository = usersRepository;

  final UsersRepository _usersRepository;

  bool _isLoading = false;
  bool get isLoading => _isLoading;
  void setIsLoading(bool values) {
    _isLoading = values;
    notifyListeners();
  }

  List<User> _users = [];
  List<User> get users => _users;
  void setUsers(List<User> values) {
    _users = values;
    notifyListeners();
  }

  PaginationOutput _paginationOutput = const PaginationOutput();
  PaginationOutput get paginationOutput => _paginationOutput;
  void setPaginationOutput(PaginationOutput value) => _paginationOutput = value;

  PaginationInput _paginationInput = const PaginationInput();
  PaginationInput get paginationInput => _paginationInput;
  void setPaginationInput(PaginationInput value) {
    _paginationInput = value;
    notifyListeners();
  }

  Future<void> changePage(int pageNumber) async {
    _paginationInput = _paginationInput.copyWith(
      page: pageNumber,
    );
    await load();
  }

  UserFilters _userFilters = const UserFilters();

  String? get nameFilter => _userFilters.nome;
  void setNameFilter(String? value) {
    _userFilters = _userFilters.copyWith(nome: value);
    notifyListeners();
  }

  String? get emailFilter => _userFilters.email;
  void setEmailFilter(String? value) {
    _userFilters = _userFilters.copyWith(email: value);
    notifyListeners();
  }

  UserRole? get roleFilter => UserRole.values
      .firstWhereOrNull((role) => role.value == _userFilters.role);
  void setRoleFilter(UserRole? role) {
    _userFilters = _userFilters.copyWith(role: role?.value);
    notifyListeners();
  }

  Future<bool> applyFilters() async {
    final success = await load();

    return success;
  }

  Future<bool> resetFilters() async {
    _userFilters = const UserFilters();
    notifyListeners();

    final success = await load();

    return success;
  }

  Future<bool> load() async {
    try {
      setIsLoading(true);

      final response = await _usersRepository.findAll(
        paginationInput: _paginationInput,
        filters: _userFilters,
      );

      _users = response.$1;
      _paginationOutput = response.$2;

      notifyListeners();

      return true;
    } catch (e) {
      debugPrint('Error while loading UsersViewmodel => $e');
    } finally {
      setIsLoading(false);
    }
    return false;
  }

  UserDetails? _selectedUser;
  UserDetails? get selectedUser => _selectedUser;
  void setSelectedUser(UserDetails? value) => _selectedUser = value;

  Future<UserDetails?> findOne(int userId) async {
    try {
      setIsLoading(true);

      final response = await _usersRepository.findOne(
        userId,
      );

      _selectedUser = response;

      return response;
    } catch (e) {
      debugPrint('Error while finding one UsersViewmodel => $e');
    } finally {
      setIsLoading(false);
    }
    return null;
  }

  Future<User?> create(User user, {bool reload = true}) async {
    try {
      final response = await _usersRepository.create(
        user,
      );

      if (reload) {
        await load();
      }

      return response;
    } catch (e) {
      debugPrint('Error while creating UsersViewmodel => $e');
    }
    return null;
  }

  Future<User?> update(int userId, User user, {bool reload = true}) async {
    try {
      final response = await _usersRepository.update(
        userId,
        user,
      );

      if (reload) {
        await load();
      }

      return response;
    } catch (e) {
      debugPrint('Error while updating UsersViewmodel => $e');
    }
    return null;
  }

  Future<User?> delete(int userId, {bool reload = true}) async {
    try {
      final response = await _usersRepository.delete(
        userId,
      );

      if (reload) {
        await load();
      }

      return response;
    } catch (e) {
      debugPrint('Error while deleting UsersViewmodel => $e');
    }
    return null;
  }

  Future<int?> updateUserClients(
    int userId, {
    required List<int> addClientIds,
    required List<int> removeClientIds,
    bool reload = true,
  }) async {
    try {
      final response = await _usersRepository.updateUserClients(
        userId,
        addClientIds,
        removeClientIds,
      );

      if (reload) {
        await load();
      }

      return response;
    } catch (e) {
      debugPrint('Error while deleting UsersViewmodel => $e');
    }
    return null;
  }

  Future<int?> removeClientsFromUser(
    int userId,
    List<int> clientIds, {
    bool reload = true,
  }) async {
    try {
      final response = await _usersRepository.removeClientsFromUser(
        userId,
        clientIds,
      );

      if (reload) {
        await load();
      }

      return response;
    } catch (e) {
      debugPrint('Error while deleting UsersViewmodel => $e');
    }
    return null;
  }
}
