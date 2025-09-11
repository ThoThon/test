// Đăng ký dịch vụ
import 'dart:async';

import 'package:v_bhxh/clean/core/domain/usecase/base_use_case.dart';
import 'package:v_bhxh/modules/register_service/domain/repository/register_service_repository.dart';

import '../entity/register_service_request.dart';

class RegisterServiceUseCase extends UseCase<RegisterServiceRequest, bool> {
  final RegisterServiceRepository _registerServiceRepository;

  RegisterServiceUseCase(this._registerServiceRepository);
  @override
  Future<bool> execute(RegisterServiceRequest input) {
    return _registerServiceRepository.registerNewService(request: input);
  }
}
