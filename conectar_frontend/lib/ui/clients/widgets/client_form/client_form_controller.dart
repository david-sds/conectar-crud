import 'package:conectar_frontend/domain/models/client/client_model.dart';
import 'package:conectar_frontend/domain/models/client_status/client_status_model.dart';
import 'package:conectar_frontend/shared/forms/address_form/address_form_controller.dart';
import 'package:flutter/material.dart';

class ClientFormController extends ChangeNotifier {
  final formKey = GlobalKey<FormState>();

  String? _cnpj;
  String? get cnpj => _cnpj;
  setCnpj(String? value) {
    _cnpj = value;
    notifyListeners();
  }

  String? _name;
  String? get name => _name;
  setName(String? value) {
    _name = value;
    notifyListeners();
  }

  String? _legalName;
  String? get legalName => _legalName;
  setLegalName(String? value) {
    _legalName = value;
    notifyListeners();
  }

  ClientStatus? _status;
  ClientStatus? get status => _status;
  setStatus(ClientStatus? value) {
    _status = value;
    notifyListeners();
  }

  bool? _conectaPlus;
  bool? get conectaPlus => _conectaPlus;
  setConectaPlus(bool? value) {
    _conectaPlus = value;
    notifyListeners();
  }

  final AddressFormController addressFormController = AddressFormController();

  void initState(Client? initialState) {
    _cnpj = initialState?.cnpj;
    _conectaPlus = initialState?.conectaPlus;
    _legalName = initialState?.legalName;
    _name = initialState?.name;
    _status = initialState?.status;
    addressFormController.initState(initialState?.address);
    notifyListeners();
  }

  bool validate() {
    final isClientValid = formKey.currentState?.validate() ?? false;
    final isAddressValid = addressFormController.validate();

    return isClientValid && isAddressValid;
  }
}
