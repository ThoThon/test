import 'package:v_bhxh/base_app/base_app.src.dart';
import 'package:v_bhxh/core/core.src.dart';
import 'package:v_bhxh/modules/declaration_tax_code/models/info_company_response.dart';

class HomeRepository extends BaseRepository {
  HomeRepository(super.controller);

  Future<BaseResponseList<InfoCompanyResponse>> fetchInfoCompany(
      String taxCode) async {
    final body = {
      "taxCode": taxCode,
    };
    final response = await baseCallApi(
      AppApi.urlGetInfoUnit,
      EnumRequestMethod.get,
      jsonMap: body,
    );
    return BaseResponseList<InfoCompanyResponse>.fromJson(
      response,
      InfoCompanyResponse.fromJson,
    );
  }
}
