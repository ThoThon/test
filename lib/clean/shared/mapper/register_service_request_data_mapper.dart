import 'package:v_bhxh/clean/shared/mapper/mapper_src.dart';
import 'package:v_bhxh/modules/register_service/data/model/register_service_request_data.dart';
import 'package:v_bhxh/modules/register_service/domain/entity/register_service_request.dart';

class RegisterServiceRequestDataMapper extends BaseEntityMapper<
    RegisterServiceRequest, RegisterServiceRequestData> {
  @override
  RegisterServiceRequestData mapToData(RegisterServiceRequest entity) {
    return RegisterServiceRequestData(
      userId: entity.userId,
      credentialID: entity.credentialID,
    );
  }
}
