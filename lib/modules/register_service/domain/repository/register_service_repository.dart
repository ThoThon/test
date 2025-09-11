import 'package:v_bhxh/clean/core/domain/repository/base_repository_cl.dart';
import 'package:v_bhxh/modules/register_code/domain/entity/certificate.dart';

import '../entity/register_service_request.dart';
import '../entity/transaction_info.dart';

abstract class RegisterServiceRepository extends BaseRepositoryCl {
  Future<List<Certificate>> getListCert({
    required String userId,
  });

  Future<TransactionInfo> getTransactionInfo();

  Future<bool> registerNewService({
    required RegisterServiceRequest request,
  });

  Future<bool> updateInfo({
    required RegisterServiceRequest request,
  });

  Future<bool> cancelRegister();
}
