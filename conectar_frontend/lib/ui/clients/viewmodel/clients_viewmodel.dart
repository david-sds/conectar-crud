import 'package:collection/collection.dart';
import 'package:conectar_frontend/data/repositories/clients_repository.dart';
import 'package:conectar_frontend/domain/models/client/client_model.dart';
import 'package:conectar_frontend/domain/models/client_status/client_status_model.dart';
import 'package:conectar_frontend/domain/models/filters/client_filters/client_filters_model.dart';
import 'package:conectar_frontend/shared/models/pagination/pagination_input/pagination_input_model.dart';
import 'package:conectar_frontend/shared/models/pagination/pagination_output/pagination_output_model.dart';
import 'package:flutter/foundation.dart';

class ClientsViewmodel extends ChangeNotifier {
  ClientsViewmodel({
    required ClientsRepository clientsRepository,
  }) : _clientsRepository = clientsRepository;

  final ClientsRepository _clientsRepository;

  bool _isLoading = false;
  bool get isLoading => _isLoading;
  void setIsLoading(bool values) {
    _isLoading = values;
    notifyListeners();
  }

  List<Client> _clients = [];
  List<Client> get clients => _clients;
  void setClients(List<Client> values) {
    _clients = values;
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

  ClientFilters _clientFilters = const ClientFilters();

  String? get nameFilter => _clientFilters.nome;
  void setNameFilter(String? value) {
    _clientFilters = _clientFilters.copyWith(nome: value);
    notifyListeners();
  }

  String? get cnpjFilter => _clientFilters.cnpj;
  void setCnpjFilter(String? value) {
    _clientFilters = _clientFilters.copyWith(cnpj: value);
    notifyListeners();
  }

  ClientStatus? get statusFilter => ClientStatus.values
      .firstWhereOrNull((status) => status.value == _clientFilters.status);
  void setStatusFilter(ClientStatus? status) {
    _clientFilters = _clientFilters.copyWith(status: status?.value);
    notifyListeners();
  }

  bool? get conectarPlusFilter => _clientFilters.conectaPlus;
  void setConectarPlusFilter(bool? value) {
    _clientFilters = _clientFilters.copyWith(conectaPlus: value);
    notifyListeners();
  }

  Future<bool> applyFilters() async {
    final success = await load();

    return success;
  }

  Future<bool> resetFilters() async {
    _clientFilters = const ClientFilters();
    notifyListeners();

    final success = await load();

    return success;
  }

  Future<bool> load() async {
    try {
      setIsLoading(true);

      final response = await _clientsRepository.findAll(
        paginationInput: _paginationInput,
        filters: _clientFilters,
      );

      _clients = response.$1;
      _paginationOutput = response.$2;

      notifyListeners();

      return true;
    } catch (e) {
      debugPrint('Error while loading ClientsViewmodel => $e');
    } finally {
      setIsLoading(false);
    }
    return false;
  }

  Client? _selectedClient;
  Client? get selectedClient => _selectedClient;
  void setSelectedClient(Client? value) => _selectedClient = value;

  Future<Client?> findOne(int clientId) async {
    try {
      setIsLoading(true);

      final response = await _clientsRepository.findOne(
        clientId,
      );

      _selectedClient = response;

      return response;
    } catch (e) {
      debugPrint('Error while finding one ClientsViewmodel => $e');
    } finally {
      setIsLoading(false);
    }
    return null;
  }

  Future<Client?> create(Client client, {bool reload = true}) async {
    try {
      final response = await _clientsRepository.create(
        client,
      );

      if (reload) {
        await load();
      }

      return response;
    } catch (e) {
      debugPrint('Error while creating ClientsViewmodel => $e');
    }
    return null;
  }

  Future<Client?> update(int clientId, Client client,
      {bool reload = true}) async {
    try {
      final response = await _clientsRepository.update(
        clientId,
        client,
      );

      if (reload) {
        await load();
      }

      return response;
    } catch (e) {
      debugPrint('Error while updating ClientsViewmodel => $e');
    }
    return null;
  }

  Future<Client?> delete(int clientId, {bool reload = true}) async {
    try {
      final response = await _clientsRepository.delete(
        clientId,
      );

      if (reload) {
        await load();
      }

      return response;
    } catch (e) {
      debugPrint('Error while deleting ClientsViewmodel => $e');
    }
    return null;
  }

  Future<List<Client>> search(String search) async {
    final response = await _clientsRepository.findAll(
      filters: ClientFilters(
        nome: search,
        cnpj: search,
      ),
      paginationInput: const PaginationInput(size: 8),
    );

    return response.$1;
  }
}
