import 'package:v_bhxh/clean/shared/mapper/mapper_src.dart';
import 'package:v_bhxh/modules/unit_info/domain/entity/update_unit_info_request.dart';

import '../../../modules/unit_info/data/model/update_unit_info_request_data.dart';

class UpdateUnitInfoRequestDataMapper
    extends BaseEntityMapper<UpdateUnitInfoRequest, UpdateUnitInfoRequestData> {
  @override
  UpdateUnitInfoRequestData mapToData(UpdateUnitInfoRequest entity) {
    return UpdateUnitInfoRequestData(
      toChucId: entity.organizationId,
      tenToChuc: entity.organizationName,
      diaChiDk: entity.registeredAddress,
      diaChi: entity.address,
      mailLienLac: entity.contactEmail,
      tenNguoiKy: entity.signerName,
      telReceiver: entity.receiverPhone,
      jobTitle: entity.jobTitle,
      loaiDoiTuong: entity.objectType,
      tenNguoiKeKhai: entity.declarerName,
      luongCoSo: entity.salary,
      phuongThucDong: entity.paymentMethod,
      ptNhanKq: entity.resultReceivingMethod,
    );
  }
}
