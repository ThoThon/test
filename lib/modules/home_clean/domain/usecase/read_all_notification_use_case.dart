import 'dart:async';

import 'package:v_bhxh/clean/core/domain/usecase/base_use_case.dart';
import 'package:v_bhxh/modules/home_clean/domain/repository/home_repository.dart';

class ReadAllNotificationUseCase extends NoInputUseCase {
  final HomeRepository _homeRepository;

  ReadAllNotificationUseCase(this._homeRepository);

  @override
  FutureOr execute() {
    return _homeRepository.realAllNotification();
  }
}
