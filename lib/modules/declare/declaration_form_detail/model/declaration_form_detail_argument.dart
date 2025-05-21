import 'package:v_bhxh/modules/declare/declare_info/model/model_src.dart';

enum DeclarationFormDetailAction {
  create,
  edit;

  bool get isCreate => this == DeclarationFormDetailAction.create;
  bool get isEdit => this == DeclarationFormDetailAction.edit;
}

class DeclarationFormDetailArgument {
  final DeclarationFormDetailAction action;
  final DeclarationForm? declarationForm;

  /// Họ và tên từ tab D02-LT
  final String? fullName;

  /// Mã số BHXH từ tab D02-LT
  final String? bhxhCode;

  DeclarationFormDetailArgument({
    required this.action,
    this.declarationForm,
    this.fullName,
    this.bhxhCode,
  });
}
