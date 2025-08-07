import 'package:v_bhxh/modules/forgot_password/data/model/forgot_password_request_data.dart';
import 'package:v_bhxh/modules/forgot_password/domain/entity/forgot_password_request.dart';
import 'package:v_bhxh/shares/mapper/base/base_data_mapper.dart';

class ForgotPasswordRequestDataMapper
    extends BaseDataMapper<ForgotPasswordRequestData, ForgotPasswordRequest>
    with DataMapperMixin {
  @override
  ForgotPasswordRequest mapToEntity(ForgotPasswordRequestData? data) {
    return ForgotPasswordRequest(
      unitCode: data?.unitCode ?? '',
      taxCode: data?.taxCode ?? '',
    );
  }

  @override
  ForgotPasswordRequestData mapToData(ForgotPasswordRequest entity) {
    return ForgotPasswordRequestData(
      unitCode: entity.unitCode,
      taxCode: entity.taxCode,
    );
  }
}
