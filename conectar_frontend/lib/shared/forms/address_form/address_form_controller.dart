import 'dart:convert';

import 'package:conectar_frontend/domain/models/address/address_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AddressFormController with ChangeNotifier {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  GlobalKey<FormState> get formKey => _formKey;
  void setFormKey(GlobalKey<FormState> value) => _formKey = value;

  bool _isLoading = false;
  bool get isLoading => _isLoading;
  void setIsLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  String? _number;
  String? get number => _number;
  void setNumber(String? value) {
    _number = value;
    notifyListeners();
  }

  String? _street;
  String? get street => _street;
  void setStreet(String? value) {
    _street = value;
    notifyListeners();
  }

  String? _district;
  String? get district => _district;
  void setDistrict(String? value) {
    _district = value;
    notifyListeners();
  }

  String? _city;
  String? get city => _city;
  void setCity(String? value) {
    _city = value;
    notifyListeners();
  }

  String? _state;
  String? get state => _state;
  void setState(String? value) {
    _state = value;
    notifyListeners();
  }

  String? _zipCode;
  String? get zipCode => _zipCode;
  void setZipCode(String? value) {
    _zipCode = value;
    notifyListeners();
  }

  String? _complement;
  String? get complement => _complement;
  void setComplement(String? value) {
    _complement = value;
    notifyListeners();
  }

  Map<String, List<dynamic>> _citiesByState = Map.of({});
  Map<String, List<dynamic>> get citiesByState => _citiesByState;
  void setCitiesByState(Map<String, List<dynamic>> value) {
    _citiesByState = Map.of(value);
    notifyListeners();
  }

  List<String> get states => _citiesByState.keys.toList();
  List<String> get cities =>
      _citiesByState[_state]?.map((e) => e.toString()).toList() ?? [];

  Future<void> loadCitiesByStates() async {
    try {
      final response =
          await rootBundle.loadString('assets/json/estados-cidades.json');
      Map<String, dynamic> data = await json.decode(response);
      final entries = (data['estados'] as List<dynamic>).map((e) => MapEntry(
            e['sigla'] as String,
            e['cidades'] as List<dynamic>,
          ));
      final citiesByState = Map.fromEntries(entries);
      setCitiesByState(citiesByState);
    } catch (e) {
      debugPrint('Error while converting json cities data => $e');
    }
  }

  Future<void> loadAddress() async {
    final zipCode = _zipCode;

    if (zipCode == null) {
      return;
    }

    try {
      setIsLoading(true);

      final response =
          await Dio().get('https://viacep.com.br/ws/$zipCode/json');

      _street = response.data['logradouro'];
      _state = response.data['uf'];
      _city = response.data['localidade'];
      _district = response.data['bairro'];

      notifyListeners();
    } catch (e) {
      debugPrint('Error while loading Endereco by CEP => $e');
    } finally {
      setIsLoading(false);
    }
  }

  Address? submit() {
    final isValid = formKey.currentState?.validate() ?? false;

    if (!isValid) {
      return null;
    }

    return Address(
      number: _number,
      street: _street,
      state: _state,
      city: _city,
      district: _district,
      zipCode: _zipCode,
      complement: _complement,
    );
  }
}
