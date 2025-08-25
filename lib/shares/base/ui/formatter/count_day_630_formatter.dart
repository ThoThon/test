import 'package:flutter/services.dart';

/// REF: BHW-3107
/// Formatter cho phép nhập số thập phân theo quy tắc:
/// - Chỉ dùng dấu "," để phân tách (không cho nhập ".").
/// - Nếu sau dấu "," nhập số:
///   + 0  → giữ nguyên 0
///   + 1-9 → tự động đổi thành 5
class CountDay630Formatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    final newText = newValue.text.replaceAll('.', ',');

    // Nếu rỗng → giữ nguyên
    if (newText.isEmpty) return newValue;

    // Tách chuỗi nhập vào thành 2 phần: trước và sau dấu ","
    final parts = newText.split(',');

    // Luôn lấy phần trước dấu "," → đây là phần nguyên
    final integerPart = parts[0];

    // Nếu có dấu "," thì parts sẽ có ít nhất 2 phần tử
    //   - parts[1] chính là phần thập phân
    //   - Nếu không có dấu "," thì gán rỗng ""
    final decimalPart = parts.length > 1 ? parts[1] : '';

    // Trường hợp chỉ có số nguyên
    if (parts.length == 1) {
      return TextEditingValue(
        text: integerPart,
      );
    }

    // Trường hợp vừa nhập dấu "," nhưng chưa có số thập phân
    if (decimalPart.isEmpty) {
      return TextEditingValue(
        text: '$integerPart,',
      );
    }

    // Trường hợp đã nhập số thập phân
    if (decimalPart == '0') {
      return TextEditingValue(
        text: '$integerPart,0',
      );
    }

    // Mọi số thập phân khác (1-9) → 5
    return TextEditingValue(
      text: '$integerPart,5',
    );
  }
}
