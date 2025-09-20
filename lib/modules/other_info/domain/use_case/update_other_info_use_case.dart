import 'dart:async';

import 'package:v_bhxh/clean/core/domain/usecase/base_use_case.dart';
import 'package:v_bhxh/modules/other_info/domain/entity/other_info.dart';
import 'package:v_bhxh/modules/other_info/domain/repository/other_info_repository.dart';

class UpdateOtherInfoUseCase extends UseCase<OtherInfo, bool> {
  final OtherInfoRepository _otherInfoRepository;

  UpdateOtherInfoUseCase(this._otherInfoRepository);

  @override
  Future<bool> execute(OtherInfo input) {
    return _otherInfoRepository.updateOtherInfo(request: input);
  }
}
