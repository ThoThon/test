import 'package:flutter/services.dart';

class RegexpEmojiUtil {
  /// Chỉ cho phép các ký tự phổ biến từ bàn phím điện thoại
  static final FilteringTextInputFormatter allowCommonCharacters =
      FilteringTextInputFormatter.allow(
    RegExp(r'''[a-zA-ZÀ-ỹ0-9\s!"#\$%&'()*+,\-./:;<=>?@\[\\\]^_`{|}~]'''),
  );
}
