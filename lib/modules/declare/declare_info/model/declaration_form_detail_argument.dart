import 'package:v_bhxh/modules/src.dart';

class DeclarationFormDetailArgument {
  final DeclarationForm? form;

  /// Task BHW-2344: Bổ sung thêm 2 trường [fullName] và [bhxhCode] để truyền dữ liệu
  /// "Họ và tên" và "Mã số BHXH" từ màn D02 -> D01.
  /// Họ và tên (Truyền từ màn D02)
  final String? fullName;

  /// Mã số BHXH (Truyền từ màn D02)
  final String? bhxhCode;

  DeclarationFormDetailArgument({
    this.form,
    this.fullName,
    this.bhxhCode,
  });
}
