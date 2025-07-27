import 'package:conectar_frontend/domain/models/client/client_model.dart';
import 'package:conectar_frontend/domain/models/client_status/client_status_model.dart';
import 'package:conectar_frontend/shared/forms/address_form/address_form.dart';
import 'package:conectar_frontend/shared/widgets/custom_dropdown.dart';
import 'package:conectar_frontend/shared/widgets/custom_input.dart';
import 'package:conectar_frontend/ui/clients/widgets/client_form/client_form_controller.dart';
import 'package:flutter/material.dart';

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
  Widget build(BuildContext context) {
    return Form(
      key: ctrl.formKey,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          CustomInput(
            labelText: 'CNPJ',
            initialValue: ctrl.cnpj,
            onChanged: ctrl.setCnpj,
          ),
          CustomInput(
            labelText: 'Razão social',
            initialValue: ctrl.name,
            onChanged: ctrl.setName,
          ),
          CustomInput(
            labelText: 'Nome na fachada',
            initialValue: ctrl.legalName,
            onChanged: ctrl.setLegalName,
          ),
          Row(
            children: [
              Flexible(
                child: CustomDropdown<ClientStatus?>(
                  labelText: 'Buscar por status',
                  itemLabel: (value) => value?.label,
                  items: ClientStatus.values,
                  onChanged: ctrl.setStatus,
                  value: ctrl.status,
                ),
              ),
              const SizedBox(width: 8),
              Flexible(
                child: CustomDropdown<bool>(
                  labelText: 'Buscar por conectar+',
                  itemLabel: (value) => value ? 'Possúi' : 'Não possúi',
                  items: const [true, false],
                  onChanged: ctrl.setConectaPlus,
                  value: ctrl.conectaPlus,
                ),
              ),
            ],
          ),
          AddressForm(
            controller: ctrl.addressFormController,
          ),
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
                  final client = ctrl.submit();
                  if (client == null) {
                    return;
                  }
                  await widget.onSubmit?.call(client);
                },
                child: const Text('Criar cliente'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
