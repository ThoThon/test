import 'package:v_bhxh/base_app/model/base_response.dart';
import 'package:v_bhxh/base_app/repository_base/repository_base.src.dart';
import 'package:v_bhxh/modules/declare_info_630c/model/declare_info_630c_request.dart';

import '../../src.dart';
import '../model/declare_info_630c_response.dart';

class DeclareInfo630cRepository extends BaseRepository {
  DeclareInfo630cRepository(super.controller);

  Future<BaseResponse> addProcedure630c(DeclareInfo630cRequest request) async {
    final response = await baseCallApi(
      AppApi.urlAdd630c,
      EnumRequestMethod.post,
      jsonMap: request.toJson(),
    );
    return BaseResponse.fromJson(response);
  }

  Future<BaseResponse<DeclareInfo630cResponse>> getDetail630c({
    required String id,
  }) async {
    final response = await baseCallApi(
      AppApi.urlGetDetail630c,
      EnumRequestMethod.get,
      jsonMap: {
        "key": id,
      },
    );
    return BaseResponse<DeclareInfo630cResponse>.fromJson(
      response,
      fromJson: (json) => DeclareInfo630cResponse.fromJson(json),
    );
  }

  Future<BaseResponse> update630c(DeclareInfo630cRequest request) async {
    final response = await baseCallApi(
      AppApi.urlUpdate630c,
      EnumRequestMethod.post,
      jsonMap: request.toJson(),
    );
    return BaseResponse.fromJson(response);
  }
}
