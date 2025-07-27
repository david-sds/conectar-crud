import 'package:conectar_frontend/core/themes/themes.dart';
import 'package:flutter/material.dart';

enum InputType {
  text,
  password,
}

class CustomInput extends StatefulWidget {
  const CustomInput({
    this.controller,
    this.labelText,
    this.onChanged,
    this.validator,
    this.suffixIcon,
    super.key,
  }) : type = InputType.text;

  const CustomInput.password({
    this.controller,
    this.labelText,
    this.onChanged,
    this.validator,
    this.suffixIcon,
    super.key,
  }) : type = InputType.password;

  final TextEditingController? controller;
  final String? labelText;
  final void Function(String value)? onChanged;
  final String? Function(String? value)? validator;
  final InputType type;
  final Widget? suffixIcon;

  @override
  State<CustomInput> createState() => _CustomInputState();
}

class _CustomInputState extends State<CustomInput> {
  late bool _obscureText;

  @override
  void initState() {
    _obscureText = widget.type == InputType.password;
    super.initState();
  }

  Widget? getSuffixIcon() {
    if (widget.suffixIcon != null) {
      return widget.suffixIcon;
    }

    if (widget.type == InputType.password) {
      return SizedBox(
        height: 48,
        child: FilledButton(
          onPressed: () {
            setState(() {
              _obscureText = !_obscureText;
            });
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Theme.of(context).colorScheme.secondary,
            shape: RoundedRectangleBorder(
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(globalBorderRadius),
                bottomRight: Radius.circular(globalBorderRadius),
              ),
              side: BorderSide(
                color: Theme.of(context).colorScheme.primary,
                width: 1,
                style: BorderStyle.solid,
              ),
            ),
          ),
          child: Icon(
            !_obscureText
                ? Icons.visibility_off_outlined
                : Icons.visibility_outlined,
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
      );
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.labelText != null) Text(widget.labelText ?? ''),
        TextFormField(
          controller: widget.controller,
          decoration: InputDecoration(
            helperText: " ",
            suffixIcon: getSuffixIcon(),
          ),
          onChanged: widget.onChanged,
          validator: widget.validator,
          obscureText: _obscureText,
        ),
      ],
    );
  }
}
