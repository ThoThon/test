// Hủy đăng ký dịch vụ
import 'dart:async';

import 'package:v_bhxh/clean/core/domain/usecase/base_use_case.dart';
import 'package:v_bhxh/modules/register_service/domain/repository/register_service_repository.dart';

class CancelRegisterUseCase extends NoInputUseCase<bool> {
  final RegisterServiceRepository _registerServiceRepository;

  CancelRegisterUseCase(this._registerServiceRepository);
  @override
  Future<bool> execute() {
    return _registerServiceRepository.cancelRegister();
  }
}
