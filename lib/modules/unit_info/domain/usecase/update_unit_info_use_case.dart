import 'dart:async';

import 'package:v_bhxh/clean/core/domain/usecase/base_use_case.dart';
import 'package:v_bhxh/modules/unit_info/domain/entity/update_unit_info_request.dart';
import 'package:v_bhxh/modules/unit_info/domain/repository/unit_info_repository.dart';

class UpdateUnitInfoUseCase extends UseCase<UpdateUnitInfoRequest, bool> {
  final UnitInfoRepository _unitInfoRepository;

  UpdateUnitInfoUseCase(this._unitInfoRepository);

  @override
  Future<bool> execute(UpdateUnitInfoRequest input) {
    return _unitInfoRepository.updateAccountInfo(request: input);
  }
}
