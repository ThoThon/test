import 'package:flutter/services.dart';
import 'package:tiengviet/tiengviet.dart';

class VietnameseWithoutDiacriticsFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    final newText = TiengViet.parse(newValue.text);
    return newValue.copyWith(
      text: newText,
      selection: TextSelection.collapsed(offset: newText.length),
    );
  }
}
