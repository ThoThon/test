import 'package:v_bhxh/clean/shared/mapper/mapper_src.dart';
import 'package:v_bhxh/modules/register_code/data/model/tax_code_verify_request_data.dart';
import 'package:v_bhxh/modules/register_code/domain/entity/tax_code_verify_request.dart';

class TaxCodeVerifyRequestDataMapper
    extends BaseDataMapper<TaxCodeVerifyRequestData, TaxCodeVerifyRequest>
    with DataMapperMixin {
  @override
  TaxCodeVerifyRequest mapToEntity(TaxCodeVerifyRequestData? data) {
    return TaxCodeVerifyRequest(
      taxCode: data?.taxCode ?? '',
      userId: data?.userId ?? '',
      credentialID: data?.credentialID ?? '',
    );
  }

  @override
  TaxCodeVerifyRequestData mapToData(TaxCodeVerifyRequest entity) {
    return TaxCodeVerifyRequestData(
      taxCode: entity.taxCode,
      userId: entity.userId,
      credentialID: entity.credentialID,
    );
  }
}
