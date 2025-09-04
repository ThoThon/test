import 'package:v_bhxh/clean/core/domain/usecase/base_use_case.dart';

import '../entity/certificate.dart';
import '../repository/register_code_repository.dart';

class GetCertificateUseCase extends UseCase<String, List<Certificate>> {
  final RegisterCodeRepository _registerCodeRepository;

  GetCertificateUseCase(this._registerCodeRepository);

  @override
  Future<List<Certificate>> execute(String input) {
    return _registerCodeRepository.getListCert(userId: input);
  }
}
