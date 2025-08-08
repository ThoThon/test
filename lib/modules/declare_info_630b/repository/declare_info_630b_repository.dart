import 'package:v_bhxh/base_app/model/base_model.src.dart';
import 'package:v_bhxh/base_app/repository_base/repository_base.src.dart';
import 'package:v_bhxh/modules/src.dart';

import '../model/declare_info_630b_request.dart';

class DeclareInfo630bRepository extends BaseRepository {
  DeclareInfo630bRepository(super.controller);

  Future<BaseResponse> addProcedure630b(DeclareInfo630bRequest request) async {
    final response = await baseCallApi(
      AppApi.urlAdd630b,
      EnumRequestMethod.post,
      jsonMap: request.toJson(),
    );
    return BaseResponse.fromJson(response);
  }
}
