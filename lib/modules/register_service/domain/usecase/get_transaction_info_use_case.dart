// Lấy thông tin giao dịch của tài khoản
import 'dart:async';

import 'package:v_bhxh/clean/core/domain/usecase/base_use_case.dart';
import 'package:v_bhxh/modules/register_service/domain/entity/transaction_info.dart';
import 'package:v_bhxh/modules/register_service/domain/repository/register_service_repository.dart';

class GetTransactionInfoUseCase extends NoInputUseCase<TransactionInfo> {
  final RegisterServiceRepository _registerServiceRepository;

  GetTransactionInfoUseCase(this._registerServiceRepository);
  @override
  Future<TransactionInfo> execute() {
    return _registerServiceRepository.getTransactionInfo();
  }
}
