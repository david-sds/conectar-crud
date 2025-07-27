import 'package:flutter/material.dart';

class CustomDropdown<T> extends StatelessWidget {
  const CustomDropdown({
    this.labelText,
    this.items = const [],
    this.value,
    this.itemLabel,
    this.onChanged,
    this.validator,
    super.key,
  });

  final String? labelText;
  final List<T> items;
  final String? Function(T value)? itemLabel;
  final void Function(T? value)? onChanged;
  final T? value;
  final String? Function(T? value)? validator;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (labelText != null) Text(labelText ?? ''),
        DropdownButtonFormField<T>(
          validator: (value) => validator?.call(value),
          decoration: const InputDecoration(
            helperText: " ",
          ),
          value: items.contains(value) ? value : null,
          items: items
              .map(
                (item) => DropdownMenuItem<T>(
                  value: item,
                  child: Text(
                    itemLabel?.call(item) ?? item.toString(),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                ),
              )
              .toList(),
          onChanged: onChanged == null
              ? null
              : (value) {
                  validator?.call(value);
                  onChanged?.call(value);
                },
        ),
      ],
    );
  }
}
