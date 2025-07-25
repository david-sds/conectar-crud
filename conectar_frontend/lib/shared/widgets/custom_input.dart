import 'package:flutter/material.dart';

class CustomInput extends StatelessWidget {
  const CustomInput({
    this.labelText,
    this.onChanged,
    this.validator,
    super.key,
  });

  final String? labelText;
  final void Function(String)? onChanged;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (labelText != null) Text(labelText ?? ''),
        TextFormField(
          decoration: const InputDecoration(
            helperText: " ",
          ),
          onChanged: onChanged,
          validator: validator,
        ),
      ],
    );
  }
}
