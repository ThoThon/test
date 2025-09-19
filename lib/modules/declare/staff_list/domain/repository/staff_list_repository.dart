import 'package:v_bhxh/clean/core/domain/repository/base_repository_cl.dart';

import '../../../../../shares/model/upload_attachments_request.dart';
import '../entity/entity_src.dart';

abstract class StaffListRepository extends BaseRepositoryCl {
  Future<StaffList> getListOfDeclaredStaff({
    required String declarationPeriodId,
  });

  Future<String> uploadImage({
    required UploadImageRequest request,
  });

  Future<SaveXmlResultCl> saveXml({
    required String declarationPeriodId,
  });

  Future<bool> deleteImage({
    required UploadImageRequest request,
  });

  /// Xóa nhân viên (Xóa toàn bộ hồ sơ TK1 D01 của nhân viên đó)
  Future<bool> deleteD02Tk1D01({
    required String id,
  });

  /// Xóa nhân viên (Xóa toàn bộ hồ sơ TK1 D01 của nhân viên đó)
  Future<bool> deleteTk1D01({
    required String id,
  });
}
