import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

extension StringExtension on String {
  String capitalize() {
    return '${this[0].toUpperCase()}${substring(1).toLowerCase()}';
  }

  String initials() {
    if (isEmpty) {
      return '';
    }
    if (length == 1) {
      return this[0].toUpperCase();
    }

    return '${this[0].toUpperCase()}${this[1].toUpperCase()}';
  }

  String normalize() {
    if (isEmpty) {
      return '';
    }
    var charsWithAccent =
        'ÀÁÂÃÄÅàáâãäåÒÓÔÕÕÖØòóôõöøÈÉÊËèéêëðÇçÐÌÍÎÏìíîïÙÚÛÜùúûüÑñŠšŸÿýŽž';
    var charsWithoutAccent =
        'AAAAAAaaaaaaOOOOOOOooooooEEEEeeeeeCcDIIIIiiiiUUUUuuuuNnSsYyyZz';
    var result = this;
    for (var i = 0; i < charsWithAccent.length; i++) {
      result = result.replaceAll(charsWithAccent[i], charsWithoutAccent[i]);
    }
    return result;
  }

  bool hasOnlyNumbers() {
    var result = this;
    if (result.isEmpty) {
      return false;
    }
    result = result.replaceAll(RegExp(r'[0-9]'), '');
    return !result.isNotEmpty;
  }

  String filterNumberOnly() {
    var result = this;
    result = result.replaceAll(RegExp(r'\D'), '');
    return result;
  }

  String mask(String mask) {
    try {
      return MaskTextInputFormatter()
          .updateMask(
            mask: mask,
            newValue: TextEditingValue(
              text: this,
            ),
          )
          .text;
    } catch (e) {
      debugPrint('Something went wrong while applying a mask => $e');
      return this;
    }
  }
}
