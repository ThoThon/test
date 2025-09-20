import 'package:v_bhxh/clean/shared/mapper/mapper_src.dart';
import 'package:v_bhxh/modules/other_info/data/model/other_info_data.dart';
import 'package:v_bhxh/modules/other_info/domain/entity/other_info.dart';

class OtherInfoDataMapper extends BaseDataMapper<OtherInfoData, OtherInfo>
    with DataMapperMixin {
  @override
  OtherInfo mapToEntity(OtherInfoData? data) {
    return OtherInfo(
      id: data?.id,
      periodId: data?.kyKeKhaiId ?? '',
      approvalRound: data?.dotXetDuyet ?? '',
      phoneNumber: data?.soDienThoai ?? '',
      bankAccount: data?.soTaiKhoan ?? '',
      bankName: data?.moTai ?? '',
      branchName: data?.chiNhanh ?? '',
      unitHead: data?.thuTruongDonVi ?? '',
      lateSubmissionReason: data?.lyDoNopCham ?? '',
      attachedPaperDocuments: data?.guiKemHoSoGiay ?? false,
    );
  }

  @override
  OtherInfoData mapToData(OtherInfo entity) {
    return OtherInfoData(
      id: entity.id,
      kyKeKhaiId: entity.periodId,
      dotXetDuyet: entity.approvalRound,
      soDienThoai: entity.phoneNumber,
      soTaiKhoan: entity.bankAccount,
      moTai: entity.bankName,
      chiNhanh: entity.branchName,
      thuTruongDonVi: entity.unitHead,
      lyDoNopCham: entity.lateSubmissionReason,
      guiKemHoSoGiay: entity.attachedPaperDocuments,
    );
  }
}
