import 'package:v_bhxh/clean/shared/mapper/mapper_src.dart';
import 'package:v_bhxh/modules/register_service/data/model/transaction_info_data.dart';
import 'package:v_bhxh/modules/register_service/domain/entity/transaction_info.dart';

class TransactionInfoDataMapper
    extends BaseDataMapper<TransactionInfoData, TransactionInfo> {
  @override
  TransactionInfo mapToEntity(TransactionInfoData? data) {
    return TransactionInfo(
      idCongTy: data?.idCongTy ?? '',
      tenCongTy: data?.tenCongTy ?? '',
      maSoThue: data?.maSoThue ?? '',
      maDonVi: data?.maDonVi ?? '',
      maCQQL: data?.maCQQL ?? '',
      tenCQQL: data?.tenCQQL ?? '',
      tenChuTheCTS: data?.tenChuTheCTS ?? '',
      tenToChucCKS: data?.tenToChucCKS ?? '',
      thoiHanTuNgay: data?.thoiHanTuNgay ?? DateTime.now(),
      thoiHanDenNgay: data?.thoiHanDenNgay ?? DateTime.now(),
      email: data?.email ?? '',
      dienThoai: data?.dienThoai ?? '',
      soSerialCTS: data?.soSerialCTS ?? '',
      userId: data?.userId ?? '',
    );
  }
}
