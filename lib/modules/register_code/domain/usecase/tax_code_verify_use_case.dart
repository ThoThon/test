import 'dart:async';

import 'package:v_bhxh/clean/core/domain/usecase/base_use_case.dart';
import 'package:v_bhxh/modules/register_code/domain/entity/tax_code_verify_request.dart';
import 'package:v_bhxh/modules/register_code/domain/repository/register_code_repository.dart';

class TaxCodeVerifyUseCase extends UseCase<TaxCodeVerifyRequest, bool> {
  final RegisterCodeRepository _registerCodeRepository;

  TaxCodeVerifyUseCase(this._registerCodeRepository);

  @override
  Future<bool> execute(TaxCodeVerifyRequest input) {
    return _registerCodeRepository.taxCodeVerify(request: input);
  }
}
