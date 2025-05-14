import 'package:v_bhxh/modules/declare/declare_info/model/model_src.dart';

enum CheckListDetailAction {
  create,
  edit;

  bool get isCreate => this == CheckListDetailAction.create;
  bool get isEdit => this == CheckListDetailAction.edit;
}

class CheckListDetailArgument {
  final CheckListDetailAction action;
  final DocumentCheckList? checkList;

  CheckListDetailArgument({
    required this.action,
    this.checkList,
  });
}
