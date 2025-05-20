import 'package:flutter/services.dart';

import 'currency_utils.dart';

class NumericTextFormatter extends TextInputFormatter {
  // Nếu định dạng là tiền của Việt Nam : true, ngoại tệ : false
  final bool isDot;

  // Độ dài số thập phân
  final int lastDecimal;

  // Độ dài số nguyên
  final int maxLengthNum;

  NumericTextFormatter({
    required this.maxLengthNum,
    required this.lastDecimal,
    this.isDot = false,
  });

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    if (newValue.text.isEmpty) {
      return newValue.copyWith(text: '');
    } else if (newValue.text.compareTo(oldValue.text) != 0) {
      if (newValue.text.replaceAll(RegExp(r"[-0-9.,]"), '').isNotEmpty) {
        return newValue = oldValue;
      }

      final newString = CurrencyUtils.formatCurrencyForeign(
        newValue.text,
        isDot: isDot,
        lastDecimal: lastDecimal,
        maxLengthNum: maxLengthNum,
      );

      return TextEditingValue(
        text: newString,
        selection: TextSelection.collapsed(offset: newString.length),
      );
    } else {
      return newValue;
    }
  }
}
