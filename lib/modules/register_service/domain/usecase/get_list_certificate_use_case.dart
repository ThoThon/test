import 'dart:async';

import 'package:v_bhxh/clean/core/domain/usecase/base_use_case.dart';
import 'package:v_bhxh/modules/register_code/domain/entity/certificate.dart';

import '../repository/register_service_repository.dart';

class GetListCertificateUseCase extends UseCase<String, List<Certificate>> {
  final RegisterServiceRepository _registerServiceRepository;

  GetListCertificateUseCase(this._registerServiceRepository);
  @override
  Future<List<Certificate>> execute(String input) {
    return _registerServiceRepository.getListCert(userId: input);
  }
}
