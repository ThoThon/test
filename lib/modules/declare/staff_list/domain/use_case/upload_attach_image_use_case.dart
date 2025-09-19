import 'dart:async';

import 'package:v_bhxh/clean/core/domain/usecase/base_use_case.dart';

import '../../../../src.dart';
import '../repository/staff_list_repository.dart';

class UploadAttachImageUseCase extends UseCase<UploadImageRequest, String> {
  final StaffListRepository _staffListRepository;

  UploadAttachImageUseCase(this._staffListRepository);
  @override
  Future<String> execute(UploadImageRequest input) {
    return _staffListRepository.uploadImage(request: input);
  }
}
