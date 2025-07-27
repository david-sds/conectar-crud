import 'package:conectar_frontend/domain/models/address/address_model.dart';
import 'package:conectar_frontend/shared/forms/address_form/address_form_controller.dart';
import 'package:conectar_frontend/shared/widgets/custom_dropdown.dart';
import 'package:conectar_frontend/shared/widgets/custom_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:skeletonizer/skeletonizer.dart';

class AddressForm extends StatefulWidget {
  const AddressForm({
    this.controller,
    this.initialState,
    this.onSubmit,
    super.key,
  });

  final AddressFormController? controller;
  final Address? initialState;
  final Future<void> Function(Address address)? onSubmit;

  @override
  State<AddressForm> createState() => _AddressFormState();
}

class _AddressFormState extends State<AddressForm> {
  late AddressFormController ctrl;

  @override
  void initState() {
    ctrl = widget.controller ?? AddressFormController();
    ctrl.loadCitiesByStates();
    ctrl.setNumber(widget.initialState?.number);
    ctrl.setStreet(widget.initialState?.street);
    ctrl.setState(widget.initialState?.state);
    ctrl.setCity(widget.initialState?.city);
    ctrl.setDistrict(widget.initialState?.district);
    ctrl.setZipCode(widget.initialState?.zipCode);
    ctrl.setComplement(widget.initialState?.complement);
    super.initState();
  }

  void submit() {
    final address = ctrl.submit();

    if (address == null) {
      return;
    }

    widget.onSubmit?.call(address);
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: ctrl.formKey,
      child: ListenableBuilder(
        listenable: ctrl,
        builder: (context, widget) {
          return Skeletonizer(
            enabled: ctrl.isLoading,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Endereço'),
                const SizedBox(
                  height: 8,
                ),
                CustomInput(
                  labelText: 'CEP',
                  initialValue: ctrl.zipCode,
                  onChanged: (val) {
                    ctrl.setZipCode(val);
                  },
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.search),
                    onPressed: () async {
                      await ctrl.loadAddress();
                    },
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                CustomInput(
                  labelText: 'Rua',
                  initialValue: ctrl.street,
                  onChanged: (val) {
                    ctrl.setStreet(val);
                  },
                ),
                const SizedBox(
                  height: 8,
                ),
                Row(
                  children: [
                    Flexible(
                      child: CustomInput(
                        labelText: 'Número',
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(RegExp(r'[0-9]'))
                        ],
                        initialValue: ctrl.number,
                        onChanged: (val) {
                          ctrl.setNumber(val);
                        },
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Flexible(
                      flex: 5,
                      child: CustomInput(
                        labelText: 'Complemento',
                        initialValue: ctrl.complement,
                        onChanged: (val) {
                          ctrl.setComplement(val);
                        },
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 8,
                ),
                Row(
                  children: [
                    Flexible(
                      child: CustomDropdown(
                        labelText: 'UF',
                        items: ctrl.states,
                        value: ctrl.state,
                        itemLabel: (value) => value,
                        onChanged: (value) {
                          ctrl.setState(value);
                        },
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Flexible(
                      child: CustomDropdown(
                        labelText: 'Município',
                        items: ctrl.cities,
                        value: ctrl.city,
                        itemLabel: (value) => value,
                        onChanged: (value) {
                          ctrl.setCity(value);
                        },
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Flexible(
                      child: CustomInput(
                        labelText: 'Bairro',
                        initialValue: ctrl.district,
                        onChanged: (val) {
                          ctrl.setDistrict(val);
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
