import 'package:conectar_frontend/core/themes/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

enum InputType {
  text,
  password,
}

class CustomInput extends StatefulWidget {
  const CustomInput({
    this.controller,
    this.focusNode,
    this.labelText,
    this.hintText,
    this.onChanged,
    this.validator,
    this.suffixIcon,
    this.mask,
    this.initialValue,
    this.onFieldSubmitted,
    this.inputFormatters,
    super.key,
  }) : type = InputType.text;

  const CustomInput.password({
    this.controller,
    this.focusNode,
    this.labelText,
    this.hintText,
    this.onChanged,
    this.validator,
    this.suffixIcon,
    this.mask,
    this.inputFormatters,
    this.initialValue,
    this.onFieldSubmitted,
    super.key,
  }) : type = InputType.password;

  final TextEditingController? controller;
  final FocusNode? focusNode;
  final String? labelText;
  final String? hintText;
  final void Function(String value)? onChanged;
  final String? Function(String? value)? validator;
  final InputType type;
  final Widget? suffixIcon;
  final MaskTextInputFormatter? mask;
  final List<TextInputFormatter>? inputFormatters;
  final String? initialValue;
  final void Function(String)? onFieldSubmitted;

  @override
  State<CustomInput> createState() => _CustomInputState();
}

class _CustomInputState extends State<CustomInput> {
  late bool _obscureText;
  late TextEditingController _controller;

  @override
  void initState() {
    _controller = widget.controller ?? TextEditingController();
    _obscureText = widget.type == InputType.password;
    _controller.value = TextEditingValue(text: widget.initialValue ?? '');

    final maskedInitialValue = widget.mask?.maskText(widget.initialValue ?? '');

    _controller.value = maskedInitialValue != null
        ? TextEditingValue(text: maskedInitialValue)
        : TextEditingValue.empty;

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
            visualDensity: VisualDensity.compact,
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
    final maskInputFormatter = widget.mask;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.labelText != null) Text(widget.labelText ?? ''),
        TextFormField(
          controller: _controller,
          focusNode: widget.focusNode,
          decoration: InputDecoration(
            hintText: widget.hintText,
            helperText: " ",
            suffixIcon: getSuffixIcon(),
          ),
          onChanged: widget.onChanged,
          validator: widget.validator,
          obscureText: _obscureText,
          inputFormatters: [
            ...(widget.inputFormatters ?? []),
            if (maskInputFormatter != null) maskInputFormatter
          ],
          onFieldSubmitted: widget.onFieldSubmitted,
        ),
      ],
    );
  }
}
