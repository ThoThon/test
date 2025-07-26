import 'package:v_bhxh/clean/core/domain/entity/base/entity.dart';

class LoginRequest implements Entity {
  final String username;
  final String password;

  LoginRequest({
    required this.username,
    required this.password,
  });
}
