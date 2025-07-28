import 'package:conectar_frontend/core/extensions/string_extension.dart';
import 'package:conectar_frontend/domain/models/address/address_model.dart';
import 'package:conectar_frontend/domain/models/client/client_model.dart';
import 'package:conectar_frontend/domain/models/client_status/client_status_model.dart';
import 'package:conectar_frontend/shared/forms/address_form/address_form.dart';
import 'package:conectar_frontend/shared/widgets/custom_dropdown.dart';
import 'package:conectar_frontend/shared/widgets/custom_input.dart';
import 'package:conectar_frontend/ui/clients/widgets/client_form/client_form_controller.dart';
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class ClientForm extends StatefulWidget {
  const ClientForm({
    this.initialState,
    this.onSubmit,
    this.onCancel,
    super.key,
  });

  final Client? initialState;
  final Future<void> Function(Client client)? onSubmit;
  final Future<void> Function()? onCancel;

  @override
  State<ClientForm> createState() => _ClientFormState();
}

class _ClientFormState extends State<ClientForm> {
  final ctrl = ClientFormController();

  @override
  void initState() {
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
          return Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  OutlinedButton(
                    onPressed: widget.onCancel,
                    child: const Text('Cancelar'),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  FilledButton(
                    onPressed: () async {
                      final isValid = ctrl.validate();
                      if (!isValid) {
                        return;
                      }

                      final client =
                          (widget.initialState ?? const Client()).copyWith(
                        cnpj: ctrl.cnpj,
                        conectaPlus: ctrl.conectaPlus,
                        legalName: ctrl.legalName,
                        name: ctrl.name,
                        status: ctrl.status,
                        address:
                            (widget.initialState?.address ?? const Address())
                                .copyWith(
                          zipCode: ctrl.addressFormController.zipCode,
                          country: 'Brasil',
                          state: ctrl.addressFormController.state,
                          city: ctrl.addressFormController.city,
                          district: ctrl.addressFormController.district,
                          street: ctrl.addressFormController.state,
                          number: ctrl.addressFormController.number,
                          complement: ctrl.addressFormController.complement,
                        ),
                      );

                      await widget.onSubmit?.call(client);
                    },
                    child: Text(
                      widget.initialState?.id == null
                          ? 'Criar cliente'
                          : 'Editar cliente',
                    ),
                  ),
                ],
              ),
              CustomInput(
                labelText: 'CNPJ',
                initialValue: ctrl.cnpj,
                onChanged: (value) {
                  ctrl.setCnpj(value.filterNumberOnly());
                },
                inputFormatters: [
                  MaskTextInputFormatter(
                    mask: '##.###.###/####-##',
                    filter: {'#': RegExp(r'[0-9]')},
                    type: MaskAutoCompletionType.lazy,
                    initialText: ctrl.cnpj,
                  ),
                ],
                validator: (value) {
                  if (value == null || value == '') {
                    return 'Obrigatório';
                  }
                  if (value.filterNumberOnly().length != 14) {
                    return 'O CNPJ deve ter 14 caracteres';
                  }
                  return null;
                },
              ),
              CustomInput(
                labelText: 'Razão social',
                initialValue: ctrl.name,
                onChanged: ctrl.setName,
                validator: (value) {
                  if (value == null || value == '') {
                    return 'Obrigatório';
                  }
                  return null;
                },
              ),
              CustomInput(
                labelText: 'Nome na fachada',
                initialValue: ctrl.legalName,
                onChanged: ctrl.setLegalName,
                validator: (value) {
                  if (value == null || value == '') {
                    return 'Obrigatório';
                  }
                  return null;
                },
              ),
              Row(
                children: [
                  Flexible(
                    child: CustomDropdown<ClientStatus?>(
                      labelText: 'Status',
                      itemLabel: (value) => value?.label,
                      items: ClientStatus.values,
                      onChanged: ctrl.setStatus,
                      value: ctrl.status,
                      validator: (value) {
                        if (value == null) {
                          return 'Obrigatório';
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(width: 8),
                  Flexible(
                    child: CustomDropdown<bool>(
                      labelText: 'Conectar+',
                      itemLabel: (value) => value ? 'Possúi' : 'Não possúi',
                      items: const [true, false],
                      onChanged: ctrl.setConectaPlus,
                      value: ctrl.conectaPlus,
                      validator: (value) {
                        if (value == null) {
                          return 'Obrigatório';
                        }
                        return null;
                      },
                    ),
                  ),
                ],
              ),
              AddressForm(
                controller: ctrl.addressFormController,
                initialState: widget.initialState?.address,
              ),
            ],
          );
        },
      ),
    );
  }
}
