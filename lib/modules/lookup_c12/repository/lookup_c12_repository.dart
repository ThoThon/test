import 'package:v_bhxh/base_app/model/base_model.src.dart';
import 'package:v_bhxh/base_app/repository_base/base_repository.dart';
import 'package:v_bhxh/modules/lookup_c12/model/file_c12_model.dart';
import 'package:v_bhxh/modules/src.dart';

class LookupC12Repository extends BaseRepository {
  LookupC12Repository(super.controller);

  Future<BaseResponseList<FileC12Model>> getC12File(int year) async {
    final response = await baseCallApi(
      AppApi.urlLookupC12,
      EnumRequestMethod.get,
      jsonMap: {'year': year},
    );
    return BaseResponseList<FileC12Model>.fromJson(
      response,
      (json) => FileC12Model.fromJson(json),
    );
  }
}
