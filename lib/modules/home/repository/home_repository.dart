import 'package:v_bhxh/base_app/base_app.src.dart';
import 'package:v_bhxh/core/core.src.dart';
import 'package:v_bhxh/modules/declaration_tax_code/models/info_company_response.dart';

class HomepositoryICare extends BaseRepository {
  HomepositoryICare(super.controller);

  Future<BaseResponseListIcare<InfoCompanyResponse>> fetchInfoCompany(
      String taxCode) async {
    final body = {
      "taxCode": taxCode,
    };
    final response = await baseCallApi(
      AppApi.urlGetInfoUnit,
      isHaveVersion: false,
      EnumRequestMethod.get,
      jsonMap: body,
    );
    return BaseResponseListIcare<InfoCompanyResponse>.fromJson(
      response,
      InfoCompanyResponse.fromJson,
    );
  }
}
