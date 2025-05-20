import 'package:v_bhxh/base_app/base_app.src.dart';
import 'package:v_bhxh/core/core.src.dart';
import 'package:v_bhxh/modules/declare/procedure_list/model/model_src.dart';

class ProcedureListRepository extends BaseRepository {
  ProcedureListRepository(super.controller);

  Future<BaseResponseList<Procedure>> getListProcedure() async {
    final response = await baseCallApi(
      AppApi.urlGetListProcedure,
      EnumRequestMethod.get,
    );

    return BaseResponseList<Procedure>.fromJson(
      response,
      (json) => Procedure.fromJson(json),
    );
  }
}
