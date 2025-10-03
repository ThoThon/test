// Cập nhật thông tin giao dịch đã đăng ký

import 'dart:async';

import 'package:v_bhxh/clean/core/domain/usecase/base_use_case.dart';
import 'package:v_bhxh/modules/register_service/domain/repository/register_service_repository.dart';

import '../entity/register_service_request.dart';

class UpdateTransactionInfoUseCase
    extends UseCase<RegisterServiceRequest, bool> {
  final RegisterServiceRepository _registerServiceRepository;

  UpdateTransactionInfoUseCase(this._registerServiceRepository);
  @override
  Future<bool> execute(RegisterServiceRequest input) {
    return _registerServiceRepository.updateInfo(request: input);
  }
}
