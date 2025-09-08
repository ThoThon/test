import 'package:v_bhxh/clean/core/domain/repository/base_repository_cl.dart';
import 'package:v_bhxh/modules/forgot_password/domain/entity/forgot_password_request.dart';

abstract class ForgotPasswordRepository extends BaseRepositoryCl {
  Future<String?> forgotPassword({
    required ForgotPasswordRequest request,
  });
}
