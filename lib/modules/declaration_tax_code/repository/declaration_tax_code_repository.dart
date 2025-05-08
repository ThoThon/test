import 'package:v_bhxh/base_app/base_app.src.dart';

import '../../src.dart';

class DeclarationTaxCodeRepositoryICare extends BaseRepository {
  DeclarationTaxCodeRepositoryICare(super.controller);

  Future<BaseResponseList<TaxModelResponse>> fetchListTaxCode({
    required String email,
  }) async {
    final request = {"email": email};
    final response = await baseCallApi(
      AppApi.urlGetListTaxCode,
      EnumRequestMethod.get,
      jsonMap: request,
    );

    return BaseResponseList<TaxModelResponse>.fromJson(
      response,
      TaxModelResponse.fromMap,
    );
  }

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
