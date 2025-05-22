import 'package:v_bhxh/base_app/model/base_response.dart';
import 'package:v_bhxh/base_app/repository_base/base_repository.dart';
import 'package:v_bhxh/core/enum/enum_request_method.dart';
import 'package:v_bhxh/core/values/app_api.dart';

import '../model/model_src.dart';

class DeclarationPeriodRepository extends BaseRepository {
  DeclarationPeriodRepository(super.controller);

  Future<BaseResponse<DeclarationPeriodList>> getDeclarationPeriods({
    required ListDeclarationPeriodRequest request,
  }) async {
    final response = await baseCallApi(
      AppApi.urlGetListDeclarationPeriod,
      EnumRequestMethod.get,
      jsonMap: request.toJson(),
    );
    return BaseResponse<DeclarationPeriodList>.fromJson(
      response,
      fromJson: (json) => DeclarationPeriodList.fromJson(json),
    );
  }

  Future<BaseResponse<CreateDeclarationPeriodResponse>>
      createDeclarationPeriod({
    required CreateDeclarationPeriodRequest request,
  }) async {
    final response = await baseCallApi(
      AppApi.urlAddDeclarationPeriod,
      EnumRequestMethod.post,
      jsonMap: request.toJson(),
    );

    return BaseResponse<CreateDeclarationPeriodResponse>.fromJson(
      response,
      fromJson: (json) => CreateDeclarationPeriodResponse.fromJson(json),
    );
  }
}
