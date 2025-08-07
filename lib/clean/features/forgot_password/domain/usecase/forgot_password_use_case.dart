import 'dart:async';

import 'package:v_bhxh/clean/core/domain/usecase/base_use_case.dart';
import 'package:v_bhxh/clean/features/forgot_password/domain/repository/forgot_password_repository.dart';

class ForgotPasswordParams {
  final String unitCode;
  final String taxCode;

  ForgotPasswordParams({required this.unitCode, required this.taxCode});
}

class ForgotPasswordUseCase extends UseCase<ForgotPasswordParams, bool> {
  final ForgotPasswordRepository _repository;

  ForgotPasswordUseCase(this._repository);

  @override
  Future<bool> execute(ForgotPasswordParams input) async {
    return await _repository.forgotPassword(
      unitCode: input.unitCode,
      taxCode: input.taxCode,
    );
  }
}
