import 'dart:async';

import 'package:v_bhxh/clean/core/domain/usecase/base_use_case.dart';
import 'package:v_bhxh/modules/unit_info/domain/repository/unit_info_repository.dart';

class GetTotalNotiUnreadUseCase extends NoInputUseCase<int> {
  final UnitInfoRepository _unitInfoRepository;

  GetTotalNotiUnreadUseCase(this._unitInfoRepository);

  @override
  Future<int> execute() {
    return _unitInfoRepository.getToTalNotiUnread();
  }
}
