import 'package:v_bhxh/clean/core/domain/usecase/base_use_case.dart';
import 'package:v_bhxh/modules/home_clean/domain/repository/home_repository.dart';

class GetUnreadNotificationCountUseCase extends NoInputUseCase<int> {
  final HomeRepository _homeRepository;

  GetUnreadNotificationCountUseCase(this._homeRepository);

  @override
  Future<int> execute() {
    return _homeRepository.getUnreadNotificationCount();
  }
}
