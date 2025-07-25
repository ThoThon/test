import 'package:flutter/services.dart';

/// Formatter cho định dạng "Đợt tháng/năm"
/// Ví dụ:
///   Input: 01012025
///   Output: "01 01/2025"
/// Giải thích:
///   - "01": Đợt
///   - "01": Tháng
///   - "2025": Năm
class CustomPeriodMonthYearFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    final digitsOnly = newValue.text.replaceAll(RegExp(r'\D'), '');

    final clipped =
        digitsOnly.length > 8 ? digitsOnly.substring(0, 8) : digitsOnly;
    final buffer = StringBuffer();

    // Đợt: 2 số đầu
    if (clipped.length >= 2) {
      buffer.write(clipped.substring(0, 2));
    } else {
      buffer.write(clipped);
    }

    // Tháng: 2 số tiếp theo (nếu có)
    if (clipped.length > 2) {
      buffer.write(' ');
      final end = clipped.length.clamp(2, 4);
      buffer.write(clipped.substring(2, end));
    }

    // Năm: 4 số cuối (nếu có)
    if (clipped.length > 4) {
      buffer.write('/');
      buffer.write(clipped.substring(4));
    }

    final formatted = buffer.toString();

    return TextEditingValue(
      text: formatted,
      selection: TextSelection.collapsed(offset: formatted.length),
    );
  }
}
