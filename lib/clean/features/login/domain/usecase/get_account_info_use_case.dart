import 'package:v_bhxh/clean/core/domain/usecase/base_use_case.dart';
import 'package:v_bhxh/clean/features/login/domain/repository/login_repository.dart';
import 'package:v_bhxh/clean/shared/entity/entity_src.dart';

class GetAccountInfoUseCase extends NoInputUseCase<AccountInfo> {
  final LoginRepository _loginRepository;

  GetAccountInfoUseCase(this._loginRepository);

  @override
  Future<AccountInfo> execute() {
    return _loginRepository.getAccountInfo();
  }
}
