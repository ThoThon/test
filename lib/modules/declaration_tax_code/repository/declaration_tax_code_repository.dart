import 'package:v_bhxh/base_app/base_app.src.dart';

import '../../src.dart';

class DeclarationTaxCodeRepositoryICare extends BaseRepository {
  DeclarationTaxCodeRepositoryICare(super.controller);

  Future<BaseResponseListIcare<TaxModelResponse>> fetchListTaxCode({
    required String email,
  }) async {
    final request = {"email": email};
    final response = await baseCallApi(
      AppApi.urlGetListTaxCode,
      isHaveVersion: false,
      EnumRequestMethod.get,
      jsonMap: request,
    );

    return BaseResponseListIcare<TaxModelResponse>.fromJson(
      response,
      TaxModelResponse.fromMap,
    );
  }

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
