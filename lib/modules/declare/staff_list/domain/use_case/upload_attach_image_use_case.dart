import 'dart:async';

import 'package:v_bhxh/clean/core/domain/usecase/base_use_case.dart';

import '../../../../../clean/shared/model/upload_image_request_data.dart';
import '../../../../src.dart';
import '../repository/staff_list_repository.dart';

class UploadAttachImageUseCase extends UseCase<UploadImageRequestData, String> {
  final StaffListRepository _staffListRepository;

  UploadAttachImageUseCase(this._staffListRepository);
  @override
  Future<String> execute(UploadImageRequestData input) {
    return _staffListRepository.uploadImage(request: input);
  }
}
