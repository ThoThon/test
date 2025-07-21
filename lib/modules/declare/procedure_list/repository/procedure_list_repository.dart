import 'package:v_bhxh/base_app/base_app.src.dart';

import '../../../src.dart';

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
