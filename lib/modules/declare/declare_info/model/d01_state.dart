import 'package:get/get.dart';
import 'package:v_bhxh/modules/declare/declare_info/model/d02/d02_detail/declare_info_detail_response.dart';
import 'package:v_bhxh/modules/declare_607/declare_info_607/model/declare_info_detail_response_607.dart';

import 'model_src.dart';

class D01State {
  final forms = const <DeclarationForm>[].obs;

  void mapFromD02Detail(DeclareInfoDetailResponse detail) {
    forms.value = detail.d01Dts.map((e) {
      return DeclarationForm.fromResponse(e);
    }).toList();
  }

  void mapFromTk1Detail(DeclareInfoDetailResponse607 detail) {
    forms.value = detail.d01Dts.map((e) {
      return DeclarationForm.fromResponse(e);
    }).toList();
  }
}
