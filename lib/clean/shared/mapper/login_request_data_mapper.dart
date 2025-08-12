import 'package:v_bhxh/clean/features/login/data/model/login_request_data.dart';
import 'package:v_bhxh/clean/features/login/domain/entity/login_request.dart';
import 'package:v_bhxh/clean/shared/mapper/base/base_data_mapper.dart';

class LoginRequestDataMapper
    extends BaseEntityMapper<LoginRequest, LoginRequestData> {
  @override
  LoginRequestData mapToData(LoginRequest entity) {
    return LoginRequestData(
      username: entity.username,
      password: entity.password,
    );
  }
}
