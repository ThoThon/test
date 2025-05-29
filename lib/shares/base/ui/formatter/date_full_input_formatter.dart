import 'package:flutter/services.dart';

class DateInputFormatter extends TextInputFormatter {
  final maxLength = 8;

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    String digitsOnly = newValue.text.replaceAll('/', '');

    // Nếu độ dài vượt quá 8 -> cắt lại
    if (digitsOnly.length > maxLength) {
      digitsOnly = digitsOnly.substring(0, maxLength);
    }

    // Nếu đang nhập phần ngày (2 số đầu tiên)
    if (digitsOnly.length >= 2) {
      int day = int.tryParse(digitsOnly.substring(0, 2)) ?? 0;
      if (day < 1 || day > 31) {
        return oldValue; // dừng lại nếu ngày không hợp lệ
      }
    }

    // Nếu đang nhập cả ngày và tháng (4 số đầu)
    if (digitsOnly.length >= 4) {
      int month = int.tryParse(digitsOnly.substring(2, 4)) ?? 0;
      if (month < 1 || month > 12) {
        return oldValue; // dừng lại nếu tháng không hợp lệ
      }
    }

    // Kiểm tra năm không lớn hơn năm hiện tại
    if (digitsOnly.length == 8) {
      int year = int.tryParse(digitsOnly.substring(4, 8)) ?? 0;
      int currentYear = DateTime.now().year;
      if (year > currentYear) {
        return oldValue; // dừng lại nếu năm lớn hơn hiện tại
      }
    }

    // Format tự động thêm dấu `/` sau ngày và tháng
    StringBuffer buffer = StringBuffer();
    for (int i = 0; i < digitsOnly.length; i++) {
      buffer.write(digitsOnly[i]);
      if ((i == 1 || i == 3) && i != digitsOnly.length - 1) {
        buffer.write('/');
      }
    }

    return TextEditingValue(
      text: buffer.toString(),
      selection: TextSelection.collapsed(offset: buffer.length),
    );
  }
}
