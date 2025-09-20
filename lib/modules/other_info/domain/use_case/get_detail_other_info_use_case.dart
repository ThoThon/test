import 'dart:async';

import 'package:v_bhxh/clean/core/domain/usecase/base_use_case.dart';
import 'package:v_bhxh/modules/other_info/domain/entity/other_info.dart';
import 'package:v_bhxh/modules/other_info/domain/repository/other_info_repository.dart';

class GetDetailOtherInfoUseCase extends UseCase<String, OtherInfo> {
  final OtherInfoRepository _otherInfoRepository;

  GetDetailOtherInfoUseCase(this._otherInfoRepository);

  @override
  Future<OtherInfo> execute(String input) {
    return _otherInfoRepository.getOtherInfoDetail(key: input);
  }
}
