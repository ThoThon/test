import 'dart:async';

import 'package:v_bhxh/clean/core/domain/usecase/base_use_case.dart';
import 'package:v_bhxh/modules/declare/staff_list/domain/repository/staff_list_repository.dart';

import '../../../../src.dart';

class DeleteAttachImageUseCase extends UseCase<UploadImageRequest, bool> {
  final StaffListRepository _staffListRepository;

  DeleteAttachImageUseCase(this._staffListRepository);

  @override
  FutureOr<bool> execute(UploadImageRequest input) {
    return _staffListRepository.deleteImage(
      request: UploadImageRequest(
        periodId: input.periodId,
        file: input.file,
      ),
    );
  }
}
