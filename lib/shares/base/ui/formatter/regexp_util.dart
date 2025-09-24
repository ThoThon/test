import 'package:flutter/services.dart';

class RegexpUtil {
  /// Chỉ cho phép các ký tự phổ biến từ bàn phím điện thoại
  static final FilteringTextInputFormatter allowCommonCharacters =
      FilteringTextInputFormatter.allow(
    RegExp(r'''[a-zA-ZÀ-ỹ0-9\s!"“‘•¥€#₫\$%&'()*+,\-./:;<=>?@\[\\\]^_`{|}~]'''),
  );

  /// REF: VBHXHMOB-110
  /// Chỉ cho phép nhập số và dấu chấm hoặc dấu phẩy
  ///
  /// [isDot] true: phân cách phần nghìn bởi dấu chấm, false: phân cách phần nghìn bởi dấu phẩy
  static FilteringTextInputFormatter allowNumberByDotOrComma({
    required bool isDot,
  }) =>
      FilteringTextInputFormatter.allow(
        isDot ? RegExp(r'[0-9,]') : RegExp(r'[0-9.]'),
      );
}
