import 'package:v_bhxh/clean/core/domain/usecase/base_use_case.dart';
import 'package:v_bhxh/clean/features/login/domain/repository/login_repository.dart';

class GetUnreadNotificationCountUseCase extends NoInputUseCase<int> {
  final LoginRepository _loginRepository;

  GetUnreadNotificationCountUseCase(this._loginRepository);

  @override
  Future<int> execute() {
    return _loginRepository.getUnreadNotificationCount();
  }
}
