import 'package:conectar_frontend/core/extensions/string_extension.dart';
import 'package:conectar_frontend/domain/models/address/address_model.dart';
import 'package:conectar_frontend/shared/forms/address_form/address_form_controller.dart';
import 'package:conectar_frontend/shared/widgets/custom_dropdown.dart';
import 'package:conectar_frontend/shared/widgets/custom_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
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
    ctrl.initState(widget.initialState);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: ctrl.formKey,
      child: ListenableBuilder(
        listenable: ctrl,
        builder: (context, _) {
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
                    ctrl.setZipCode(val.filterNumberOnly());
                  },
                  validator: (value) {
                    if (value == null || value == '') {
                      return 'Obrigatório';
                    }
                    if (value.filterNumberOnly().length != 8) {
                      return 'O CEP deve ter 8 caracteres';
                    }
                    return null;
                  },
                  mask: MaskTextInputFormatter(
                    mask: '#####-###',
                    filter: {'#': RegExp(r'[0-9]')},
                    type: MaskAutoCompletionType.lazy,
                    initialText: ctrl.zipCode,
                  ),
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
                  validator: (value) {
                    if (value == null || value == '') {
                      return 'Obrigatório';
                    }

                    return null;
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
                        validator: (value) {
                          if (value == null || value == '') {
                            return 'Obrigatório';
                          }

                          return null;
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
                        validator: (value) {
                          if (value == null || value == '') {
                            return 'Obrigatório';
                          }

                          return null;
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
                        validator: (value) {
                          if (value == null || value == '') {
                            return 'Obrigatório';
                          }

                          return null;
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
                        validator: (value) {
                          if (value == null || value == '') {
                            return 'Obrigatório';
                          }

                          return null;
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
