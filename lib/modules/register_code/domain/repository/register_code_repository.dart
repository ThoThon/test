import 'package:v_bhxh/clean/core/domain/repository/base_repository_cl.dart';

import '../entity/certificate.dart';
import '../entity/first_time_register_request.dart';
import '../entity/register_code_categories.dart';
import '../entity/tax_code_verify_request.dart';

abstract class RegisterCodeRepository extends BaseRepositoryCl {
  Future<RegisterCodeCategories> getCategories();

  Future<List<Certificate>> getListCert({
    required String userId,
  });

  Future<bool> firstTimeRegister({
    required FirstTimeRegisterRequest request,
  });

  Future<bool> taxCodeVerify({
    required TaxCodeVerifyRequest request,
  });
}
