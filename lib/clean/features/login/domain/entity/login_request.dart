import 'package:v_bhxh/clean/core/domain/entity/entity.dart';
import 'package:v_bhxh/clean/features/login/data/model/login_request_data.dart';

class LoginRequest extends Entity {
  final String username;
  final String password;

  LoginRequest({
    required this.username,
    required this.password,
  });

  LoginRequestData toData() {
    return LoginRequestData(
      username: username,
      password: password,
    );
  }
}
