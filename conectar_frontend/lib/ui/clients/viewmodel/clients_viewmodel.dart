import 'package:conectar_frontend/data/repositories/clients_repository.dart';
import 'package:conectar_frontend/domain/models/client/client_model.dart';
import 'package:flutter/foundation.dart';

final _clientsRepository = ClientsRepository();

class ClientsViewmodel extends ChangeNotifier {
  List<Client> _clients = [];
  List<Client> get clients => _clients;
  void setClients(List<Client> values) => _clients = values;

  Future<void> load() async {
    try {
      await _clientsRepository.findAll();
    } catch (e) {
      debugPrint('Error while loading ClientsViewmodel => $e');
    }
  }
}
