import 'package:v_bhxh/base_app/base_app.src.dart';

import '../../src.dart';

class DeclareInfo630aRepository extends BaseRepository {
  DeclareInfo630aRepository(super.controller);

  Future<BaseResponse> addProcedure630a(DeclareInfo630aRequest request) async {
    final response = await baseCallApi(
      AppApi.urlAdd630a,
      EnumRequestMethod.post,
      jsonMap: request.toJson(),
    );
    return BaseResponse.fromJson(response);
  }

  Future<BaseResponse<DeclareInfo630aResponse>> getDetail630a({
    required String id,
  }) async {
    final response = await baseCallApi(
      AppApi.urlGetDetail630a,
      EnumRequestMethod.get,
      jsonMap: {
        "key": id,
      },
    );

    return BaseResponse<DeclareInfo630aResponse>.fromJson(
      response,
      fromJson: (json) => DeclareInfo630aResponse.fromJson(json),
    );
  }

  Future<BaseResponse> update630a(DeclareInfo630aRequest request) async {
    final response = await baseCallApi(
      AppApi.urlUpdate630a,
      EnumRequestMethod.post,
      jsonMap: request.toJson(),
    );
    return BaseResponse.fromJson(response);
  }
}
