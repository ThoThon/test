import 'package:v_bhxh/clean/shared/mapper/mapper_src.dart';
import 'package:v_bhxh/modules/history/data/model/declaration_history_item_data.dart';
import 'package:v_bhxh/modules/history/domain/entity/declaration_history_item.dart';

class DeclarationHistoryItemDataMapper
    extends BaseDataMapper<DeclarationHistoryItemData, DeclarationHistoryItem> {
  @override
  DeclarationHistoryItem mapToEntity(DeclarationHistoryItemData? data) {
    return DeclarationHistoryItem(
      id: data?.id ?? '',
      procedureCode: data?.maThuTuc ?? '',
      submissionTime: data?.thoiGianGui ?? '',
      month: data?.thang ?? '',
      year: data?.nam ?? '',
      status: data?.trangThai ?? '',
      dossierNumber: data?.soHoSo,
      step1Status: data?.trangThaiBuoc1,
      step1Result: data?.ketQuaBuoc1,
      step2Status: data?.trangThaiBuoc2,
      step2Result: data?.ketQuaBuoc2,
      step3Status: data?.trangThaiBuoc3,
      step3Result: data?.ketQuaBuoc3,
      step4Status: data?.trangThaiBuoc4,
      step4Result: data?.ketQuaBuoc4,
    );
  }
}
