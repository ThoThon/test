import 'package:v_bhxh/clean/core/domain/repository/base_repository_cl.dart';

abstract class ForgotPasswordRepository extends BaseRepositoryCl {
  Future<String?> forgotPassword({
    required String unitCode,
    required String taxCode,
  });
}
