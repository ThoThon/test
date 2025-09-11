import 'package:v_bhxh/clean/shared/mapper/mapper_src.dart';
import 'package:v_bhxh/modules/register_service/data/model/transaction_info_data.dart';
import 'package:v_bhxh/modules/register_service/domain/entity/transaction_info.dart';

class TransactionInfoDataMapper
    extends BaseDataMapper<TransactionInfoData, TransactionInfo> {
  @override
  TransactionInfo mapToEntity(TransactionInfoData? data) {
    return TransactionInfo(
      companyId: data?.idCongTy ?? '',
      companyName: data?.tenCongTy ?? '',
      taxCode: data?.maSoThue ?? '',
      unitCode: data?.maDonVi ?? '',
      managementAgencyCode: data?.maCQQL ?? '',
      managementAgencyName: data?.tenCQQL ?? '',
      certificateOwner: data?.tenChuTheCTS ?? '',
      certificateOrgName: data?.tenToChucCKS ?? '',
      validFrom: DateTime.tryParse(data?.thoiHanTuNgay ?? '') ?? DateTime.now(),
      validTo: DateTime.tryParse(data?.thoiHanDenNgay ?? '') ?? DateTime.now(),
      email: data?.email ?? '',
      phoneNumber: data?.dienThoai ?? '',
      certificateSerial: data?.soSerialCTS ?? '',
      userId: data?.userId ?? '',
    );
  }
}
