import 'package:v_bhxh/base_app/model/base_model.src.dart';
import 'package:v_bhxh/base_app/repository_base/repository_base.src.dart';
import 'package:v_bhxh/modules/src.dart';

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

  Future<BaseResponse<DeclareInfo630bResponse>> getDetail630b({
    required String id,
  }) async {
    final response = await baseCallApi(
      AppApi.urlGetDetail630b,
      EnumRequestMethod.get,
      jsonMap: {
        "key": id,
      },
    );
    return BaseResponse<DeclareInfo630bResponse>.fromJson(
      response,
      fromJson: (json) => DeclareInfo630bResponse.fromJson(json),
    );
  }

  Future<BaseResponse> update630b(DeclareInfo630bRequest request) async {
    final response = await baseCallApi(
      AppApi.urlUpdate630b,
      EnumRequestMethod.post,
      jsonMap: request.toJson(),
    );
    return BaseResponse.fromJson(response);
  }
}
