import 'dart:async';

import 'package:v_bhxh/clean/core/domain/usecase/base_use_case.dart';

import '../entity/first_time_register_request.dart';
import '../repository/register_code_repository.dart';

class FirstTimeRegisterUseCase extends UseCase<FirstTimeRegisterRequest, bool> {
  final RegisterCodeRepository _registerCodeRepository;

  FirstTimeRegisterUseCase(this._registerCodeRepository);
  @override
  Future<bool> execute(FirstTimeRegisterRequest input) {
    return _registerCodeRepository.firstTimeRegister(
      request: input,
    );
  }

  @override
  void cancel() {
    _registerCodeRepository.cancelAllRequests();
    super.cancel();
  }
}
