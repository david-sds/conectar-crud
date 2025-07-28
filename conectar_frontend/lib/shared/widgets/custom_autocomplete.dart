import 'dart:async';

import 'package:conectar_frontend/shared/widgets/custom_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class CustomAutocomplete<T extends Object> extends StatefulWidget {
  const CustomAutocomplete({
    required this.onSelected,
    required this.onItemTitle,
    this.onItemSubtitle,
    this.debounceMs = 400,
    this.onSearch,
    this.textEditingController,
    super.key,
  });

  final void Function(T value) onSelected;
  final int debounceMs;
  final Future<List<T>> Function(String search)? onSearch;
  final String Function(T value) onItemTitle;
  final String Function(T value)? onItemSubtitle;
  final TextEditingController? textEditingController;

  @override
  State<CustomAutocomplete<T>> createState() => _CustomAutocompleteState<T>();
}

class _CustomAutocompleteState<T extends Object>
    extends State<CustomAutocomplete<T>> {
  Timer? _debounce;
  List<T> options = [];
  bool isLoading = false;
  T? highlightedOption;

  @override
  void dispose() {
    _debounce?.cancel();

    super.dispose();
  }

  Completer<List<T>>? _completer;

  Future<List<T>> _handleSearchData(String value) async {
    if (value.isEmpty) return [];

    _debounce?.cancel();
    _completer = Completer<List<T>>();

    _debounce = Timer(
      Duration(milliseconds: widget.debounceMs),
      () async {
        try {
          final result = await widget.onSearch?.call(value) ?? [];
          if (!_completer!.isCompleted) _completer!.complete(result);
        } catch (e) {
          if (!_completer!.isCompleted) _completer!.completeError(e);
        }
      },
    );

    return _completer!.future;
  }

  @override
  Widget build(BuildContext context) {
    return RawAutocomplete<T>(
      textEditingController: widget.textEditingController,
      focusNode: FocusNode(),
      optionsBuilder: (TextEditingValue value) async {
        return await _handleSearchData(value.text);
      },
      onSelected: widget.onSelected,
      displayStringForOption: widget.onItemTitle,
      fieldViewBuilder: (context, controller, focusNode, onSubmitted) {
        return CustomInput(
          controller: controller,
          focusNode: focusNode,
          suffixIcon: isLoading
              ? const Padding(
                  padding: EdgeInsets.all(8),
                  child: CircularProgressIndicator(strokeWidth: 2),
                )
              : const Icon(Icons.search),
          labelText: 'Clientes',
          hintText: 'Buscar...',
          onFieldSubmitted: (_) {
            final selectedOption = highlightedOption;
            if (selectedOption != null) {
              controller.text = widget.onItemTitle(selectedOption);
              widget.onSelected.call(selectedOption);
            }
          },
        );
      },
      optionsViewBuilder: (context, onSelected, options) {
        return Align(
          alignment: Alignment.topLeft,
          child: SizedBox(
            height: 400,
            child: ListView.builder(
              itemCount: options.length,
              itemBuilder: (context, index) {
                return Builder(
                  builder: (context) {
                    final option = options.elementAt(index);
                    final highlight =
                        AutocompleteHighlightedOption.of(context) == index;
                    if (highlight) {
                      highlightedOption = option;
                      SchedulerBinding.instance.addPostFrameCallback(
                        (timeStamp) async {
                          await Scrollable.ensureVisible(
                            context,
                            alignment: 0.5,
                          );
                        },
                      );
                    }

                    return Container(
                      color: highlight
                          ? Theme.of(context).colorScheme.secondary
                          : Theme.of(context).colorScheme.outlineVariant,
                      child: Material(
                        type: MaterialType.transparency,
                        child: ListTile(
                          title: Text(widget.onItemTitle(option)),
                          subtitle: widget.onItemSubtitle != null
                              ? Text(
                                  widget.onItemSubtitle?.call(option) ?? '-',
                                )
                              : null,
                          onTap: () {
                            onSelected(option);
                          },
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        );
      },
    );
  }
}
