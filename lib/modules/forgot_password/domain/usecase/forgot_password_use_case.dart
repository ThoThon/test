import 'dart:async';

import 'package:v_bhxh/clean/core/domain/usecase/base_use_case.dart';
import 'package:v_bhxh/modules/forgot_password/domain/entity/forgot_password_request.dart';
import 'package:v_bhxh/modules/forgot_password/domain/repository/forgot_password_repository.dart';

class ForgotPasswordUseCase extends UseCase<ForgotPasswordRequest, String?> {
  final ForgotPasswordRepository _repository;

  ForgotPasswordUseCase(this._repository);

  @override
  Future<String?> execute(ForgotPasswordRequest input) async {
    return _repository.forgotPassword(request: input);
  }
}
