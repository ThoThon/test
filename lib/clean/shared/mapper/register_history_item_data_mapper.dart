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
    );
  }
}
