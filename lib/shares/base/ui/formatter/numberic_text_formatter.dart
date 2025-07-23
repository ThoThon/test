import 'package:flutter/services.dart';

import 'src.dart';

class NumericTextFormatter extends TextInputFormatter {
  //0: VND, 1: Foreign
  final int type;

  // Nếu định dạng là tiền của Việt Nam : true, ngoại tệ : false
  final bool isDot;

  // Độ dài số thập phân
  final int? lastDecimal;

  // Độ dài số nguyên
  final int? maxLengthNum;

  final dynamic customMaxValue;

  NumericTextFormatter({
    this.type = 0,
    this.isDot = true,
    this.maxLengthNum,
    this.lastDecimal,
    this.customMaxValue,
  });

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    final oldText = oldValue.text; // Chuỗi trước khi người dùng thay đổi
    final newText = newValue.text; // Chuỗi mới sau khi người dùng gõ hoặc xoá

    // Nếu người dùng xoá hết, trả về chuỗi rỗng
    if (newText.isEmpty) {
      return newValue.copyWith(text: '');
    }

    // Nếu có ký tự không hợp lệ (không phải số, dấu âm, dấu chấm, dấu phẩy), không cho thay đổi
    if (newText.replaceAll(RegExp(r'[-0-9.,]'), '').isNotEmpty) {
      return oldValue;
    }

    // Ghi lại vị trí con trỏ cũ
    final oldSelectionIndex = oldValue.selection.baseOffset;

    // Format lại chuỗi số
    final formatted = type == 0
        ? CurrencyUtils.formatCurrency(
            CurrencyUtils.formatNumberCurrency(newText, isDot: isDot),
            isDot: isDot,
          )
        : CurrencyUtils.formatCurrencyForeign(
            newText,
            isDot: isDot,
            maxLengthNum: maxLengthNum,
            lastDecimal: lastDecimal,
            customMaxValue: customMaxValue,
            isConvert: true,
          );

    // Tính độ dài thay đổi giữa chuỗi mới sau khi format và chuỗi cũ
    final diff = formatted.length - oldText.length;

    // Cập nhật vị trí con trỏ dựa trên độ chênh lệch độ dài
    int newOffset = oldSelectionIndex + diff;

    // Đảm bảo vị trí con trỏ không vượt quá độ dài mới
    newOffset = newOffset.clamp(0, formatted.length);

    // Trả về TextEditingValue đã định dạng lại và có vị trí con trỏ hợp lý
    return TextEditingValue(
      text: formatted,
      selection: TextSelection.collapsed(offset: newOffset),
    );
  }
}
