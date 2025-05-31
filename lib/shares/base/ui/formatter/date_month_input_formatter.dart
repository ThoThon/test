import 'package:flutter/services.dart';

class DateMonthInputFormatter extends TextInputFormatter {
  final maxLength = 6;

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    String digitsOnly = newValue.text.replaceAll('/', '');

    // Nếu độ dài vượt quá 6 ký tự -> cắt lại
    if (digitsOnly.length > maxLength) {
      digitsOnly = digitsOnly.substring(0, maxLength);
    }

    // Kiểm tra tháng hợp lệ (2 ký tự đầu)
    if (digitsOnly.length >= 2) {
      int month = int.tryParse(digitsOnly.substring(0, 2)) ?? 0;
      if (month < 1 || month > 12) {
        return oldValue;
      }
    }

    // Format MM/yyyy
    StringBuffer buffer = StringBuffer();
    for (int i = 0; i < digitsOnly.length; i++) {
      buffer.write(digitsOnly[i]);
      if (i == 1 && digitsOnly.length > 2) {
        buffer.write('/');
      }
    }

    return TextEditingValue(
      text: buffer.toString(),
      selection: TextSelection.collapsed(offset: buffer.length),
    );
  }
}
