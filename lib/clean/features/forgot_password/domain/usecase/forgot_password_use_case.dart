import 'package:v_bhxh/clean/features/forgot_password/domain/repository/forgot_password_repository.dart';

class ForgotPasswordUseCase {
  final ForgotPasswordRepository _repository;

  ForgotPasswordUseCase(this._repository);

  Future<String?> execute({
    required String unitCode,
    required String taxCode,
  }) async {
    return await _repository.forgotPassword(
      unitCode: unitCode,
      taxCode: taxCode,
    );
  }
}
