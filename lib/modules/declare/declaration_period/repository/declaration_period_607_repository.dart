import 'package:v_bhxh/base_app/model/base_response.dart';
import 'package:v_bhxh/base_app/repository_base/base_repository.dart';
import 'package:v_bhxh/core/core.src.dart';

class DeclarationPeriod607Repository extends BaseRepository {
  DeclarationPeriod607Repository(super.controller);

  /// Xóa kỳ kê khai 607
  Future<BaseResponse> deleteDeclarationPeriod607({
    required String id,
  }) async {
    final response = await baseCallApi(
      AppApi.urlDeleteDeclarationPeriod607,
      EnumRequestMethod.delete,
      queryParameters: {'id': id},
    );
    return BaseResponse.fromJson(response);
  }
}
