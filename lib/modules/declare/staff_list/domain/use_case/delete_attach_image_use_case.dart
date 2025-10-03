import 'dart:async';

import 'package:v_bhxh/clean/core/domain/usecase/base_use_case.dart';
import 'package:v_bhxh/modules/declare/staff_list/domain/repository/staff_list_repository.dart';

import '../../../../../clean/shared/model/upload_image_request_data.dart';
import '../../../../src.dart';

class DeleteAttachImageUseCase extends UseCase<UploadImageRequestData, bool> {
  final StaffListRepository _staffListRepository;

  DeleteAttachImageUseCase(this._staffListRepository);

  @override
  Future<bool> execute(UploadImageRequestData input) {
    return _staffListRepository.deleteImage(
      kyKeKhaiId: input.periodId,
      fileName: input.file,
    );
  }
}
