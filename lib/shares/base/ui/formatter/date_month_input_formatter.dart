import 'package:flutter/services.dart';

class DateMonthInputFormatter extends TextInputFormatter {
  final int maxLength = 6; // MMYYYY

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    final rawText = newValue.text;

    // Vị trí con trỏ ban đầu
    final selectionIndex = newValue.selection.baseOffset;

    // Lọc chỉ giữ số
    String digitsOnly = rawText.replaceAll(RegExp(r'[^0-9]'), '');

    // Giới hạn 6 chữ số
    if (digitsOnly.length > maxLength) {
      digitsOnly = digitsOnly.substring(0, maxLength);
    }

    // Format thành MM/yyyy
    final buffer = StringBuffer();

    // Theo dõi số ký tự phụ được chèn (ví dụ /) để hỗ trợ cập nhật vị trí con trỏ chính xác
    int usedOffset = 0;

    // Lưu trữ vị trí con trỏ ban đầu (newValue.selection.baseOffset), sau đó sẽ được cập nhật lại dựa trên những ký tự được chèn vào (dấu /), để con trỏ không bị nhảy sai.
    int newSelectionIndex = selectionIndex;

    for (int i = 0; i < digitsOnly.length; i++) {
      if (i == 2) {
        buffer.write('/');
        if (selectionIndex > i + usedOffset) {
          newSelectionIndex++; // Dời con trỏ vì thêm '/'
        }
        usedOffset++;
      }
      buffer.write(digitsOnly[i]);
    }

    // Tính toán vị trí con trỏ mới, đảm bảo không vượt quá độ dài
    newSelectionIndex = newSelectionIndex.clamp(0, buffer.length);

    return TextEditingValue(
      text: buffer.toString(),
      selection: TextSelection.collapsed(offset: newSelectionIndex),
    );
  }
}
