import 'dart:async';

import 'package:v_bhxh/clean/core/domain/usecase/base_use_case.dart';
import 'package:v_bhxh/clean/shared/entity/account_info.dart';
import 'package:v_bhxh/modules/unit_info/domain/repository/unit_info_repository.dart';

class GetUnitInfoUseCase extends NoInputUseCase<AccountInfo> {
  final UnitInfoRepository _unitInfoRepository;

  GetUnitInfoUseCase(this._unitInfoRepository);

  @override
  Future<AccountInfo> execute() {
    return _unitInfoRepository.getAccountInfo();
  }
}
