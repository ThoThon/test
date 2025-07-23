import 'package:flutter/services.dart';

class DateYearInputFormatter extends TextInputFormatter {
  final int maxLength = 4; // yyyy

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    String newText = newValue.text;

    // Giới hạn tối đa 4 ký tự (giả định đã là số)
    if (newText.length > maxLength) {
      // Cắt bớt chuỗi nếu vượt quá maxLength
      newText = newText.substring(0, maxLength);

      // Nếu con trỏ vượt quá độ dài mới (edit ở cuối), đặt nó về cuối
      // Ngược lại nếu đang edit ở giữa, giữ nguyên vị trí con trỏ
      final offset = newValue.selection.baseOffset > newText.length
          ? newText.length
          : newValue.selection.baseOffset;

      return TextEditingValue(
        text: newText,
        selection: TextSelection.collapsed(offset: offset),
      );
    }

    return newValue;
  }
}
