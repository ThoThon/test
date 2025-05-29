import 'package:flutter/services.dart';

class DateYearInputFormatter extends TextInputFormatter {
  final int maxLength = 4;

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    String digitsOnly = newValue.text.replaceAll(RegExp(r'[^0-9]'), '');

    // Cắt tối đa 4 chữ số
    if (digitsOnly.length > maxLength) {
      digitsOnly = digitsOnly.substring(0, maxLength);
    }

    final nowYear = DateTime.now().year;
    final minYear = nowYear - 100;

    // Kiểm tra nếu đủ 4 số thì mới validate năm
    if (digitsOnly.length == 4) {
      int year = int.tryParse(digitsOnly) ?? 0;

      if (year < minYear || year > nowYear) {
        return oldValue; // không hợp lệ -> giữ nguyên
      }
    }

    return TextEditingValue(
      text: digitsOnly,
      selection: TextSelection.collapsed(offset: digitsOnly.length),
    );
  }
}
