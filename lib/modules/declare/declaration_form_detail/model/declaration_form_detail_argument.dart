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

  DeclarationFormDetailArgument({
    required this.action,
    this.declarationForm,
  });
}
