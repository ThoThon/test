import 'package:flutter/services.dart';

import 'currency_utils.dart';

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
    if (newValue.text.isEmpty) {
      return newValue.copyWith(text: '');
    } else if (newValue.text.compareTo(oldValue.text) != 0) {
      if (newValue.text.replaceAll(RegExp(r"[-0-9.,]"), '').isNotEmpty) {
        return newValue = oldValue;
      }
      final newString = type == 0
          ? CurrencyUtils.formatCurrency(
              CurrencyUtils.formatNumberCurrency(
                newValue.text,
                isDot: isDot,
              ),
              isDot: isDot,
            )
          // formatCurrencyForeign hỗ trợ số thập phân
          : CurrencyUtils.formatCurrencyForeign(
              newValue.text,
              isDot: isDot,
              maxLengthNum: maxLengthNum,
              lastDecimal: lastDecimal,
              customMaxValue: customMaxValue,
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
