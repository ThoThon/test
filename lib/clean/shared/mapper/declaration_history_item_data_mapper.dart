import 'package:v_bhxh/clean/shared/mapper/mapper_src.dart';
import 'package:v_bhxh/modules/history/data/model/declaration_history_item_data.dart';
import 'package:v_bhxh/modules/history/domain/entity/declaration_history_item.dart';

class DeclarationHistoryItemDataMapper
    extends BaseDataMapper<DeclarationHistoryItemData, DeclarationHistoryItem> {
  @override
  DeclarationHistoryItem mapToEntity(DeclarationHistoryItemData? data) {
    return DeclarationHistoryItem(
      id: data?.id ?? '',
      maThuTuc: data?.maThuTuc ?? '',
      thoiGianGui: data?.thoiGianGui ?? '',
      thang: data?.thang ?? '',
      nam: data?.nam ?? '',
      trangThai: data?.trangThai ?? '',
    );
  }
}
