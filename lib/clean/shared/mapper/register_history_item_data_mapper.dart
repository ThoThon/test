import 'package:v_bhxh/clean/shared/mapper/mapper_src.dart';
import 'package:v_bhxh/modules/history/data/model/register_history_item_data.dart';

import '../../../modules/history/domain/entity/register_history_item.dart';

class RegisterHistoryItemDataMapper
    extends BaseDataMapper<RegisterHistoryItemData, RegisterHistoryItem> {
  @override
  RegisterHistoryItem mapToEntity(RegisterHistoryItemData? data) {
    return RegisterHistoryItem(
      id: data?.messId ?? '',
      declaration: data?.toKhai ?? '',
      submissionTime: data?.thoiGianGui ?? '',
      status: data?.trangThaiTK ?? '',
      year: data?.nam ?? 0,
      month: data?.thang ?? 0,
      dossierNumber: data?.soHoSo,
      receiver: data?.tiepNhan,
      step1Result: data?.kqBuoc1,
      step2Result: data?.kqBuoc2,
      step3Result: data?.kqBuoc3,
      step1Status: data?.trangThaiBuoc1,
      step2Status: data?.trangThaiBuoc2,
      step3Status: data?.trangThaiBuoc3,
    );
  }
}
