import 'package:tiengviet/tiengviet.dart';

extension StringExt on String {
  bool get isEmailValid {
    final emailRegex = RegExp(r'^[\w\-.+%]+@(?:[\w-]+\.)+[\w]{2,6}$');
    return emailRegex.hasMatch(this);
  }

  /// Kiểm tra xem chuỗi có chứa ký tự tiếng Việt hay không
  bool get hasVietnameseChars {
    return TiengViet.parse(this) != this;
  }
}
