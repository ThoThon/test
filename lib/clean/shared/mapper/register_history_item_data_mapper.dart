import 'package:v_bhxh/clean/shared/mapper/mapper_src.dart';
import 'package:v_bhxh/modules/history/data/model/register_history_item_data.dart';

import '../../../modules/history/domain/entity/register_history_item.dart';

class RegisterHistoryItemDataMapper
    extends BaseDataMapper<RegisterHistoryItemData, RegisterHistoryItem> {
  @override
  RegisterHistoryItem mapToEntity(RegisterHistoryItemData? data) {
    return RegisterHistoryItem(
      messId: data?.messId ?? '',
      toKhai: data?.toKhai ?? '',
      thoiGianGui: data?.thoiGianGui ?? '',
      trangThaiTK: data?.trangThaiTK ?? '',
      nam: data?.nam ?? 0,
      thang: data?.thang ?? 0,
      soHoSo: data?.soHoSo,
      tiepNhan: data?.tiepNhan,
      kqBuoc1: data?.kqBuoc1,
      kqBuoc2: data?.kqBuoc2,
      kqBuoc3: data?.kqBuoc3,
      trangThaiBuoc1: data?.trangThaiBuoc1,
      trangThaiBuoc2: data?.trangThaiBuoc2,
      trangThaiBuoc3: data?.trangThaiBuoc3,
    );
  }
}
