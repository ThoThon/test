import 'package:flutter/services.dart';

class DateYearInputFormatter extends TextInputFormatter {
  final int maxLength = 4; // yyyy

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    String value = newValue.text;

    // Giới hạn tối đa 4 ký tự (giả định đã là số)
    if (value.length > maxLength) {
      value = value.substring(0, maxLength);
    }

    return TextEditingValue(
      text: value,
      selection: TextSelection.collapsed(offset: value.length),
    );
  }
}
