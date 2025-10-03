import 'dart:async';

import 'package:v_bhxh/clean/core/domain/usecase/base_use_case.dart';
import 'package:v_bhxh/modules/other_info/domain/entity/other_info.dart';
import 'package:v_bhxh/modules/other_info/domain/repository/other_info_repository.dart';

class AddOtherInfoUseCase extends UseCase<OtherInfo, String> {
  final OtherInfoRepository _otherInfoRepository;

  AddOtherInfoUseCase(this._otherInfoRepository);

  @override
  Future<String> execute(OtherInfo input) {
    return _otherInfoRepository.addOtherInfo(request: input);
  }
}
