import 'package:flutter/services.dart';

class DateMonthInputFormatter extends TextInputFormatter {
  final maxLength = 6;

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    String digitsOnly = newValue.text.replaceAll(RegExp(r'[^0-9]'), '');

    if (digitsOnly.length > maxLength) {
      digitsOnly = digitsOnly.substring(0, maxLength);
    }

    // Format MM/yyyy
    final buffer = StringBuffer();
    for (int i = 0; i < digitsOnly.length; i++) {
      buffer.write(digitsOnly[i]);
      if (i == 1 && i != digitsOnly.length - 1) {
        buffer.write('/');
      }
    }

    return TextEditingValue(
      text: buffer.toString(),
      selection: TextSelection.collapsed(offset: buffer.length),
    );
  }
}
