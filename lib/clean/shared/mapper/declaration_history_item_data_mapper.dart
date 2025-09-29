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
      step1ErrorCode: data?.maLoiBuoc1,
      step1Result: data?.ketQuaBuoc1,
      step2ErrorCode: data?.maLoiBuoc2,
      step2Result: data?.ketQuaBuoc2,
      step3ErrorCode: data?.maLoiBuoc3,
      step3Result: data?.ketQuaBuoc3,
      step4ErrorCode: data?.maLoiBuoc4,
      step4Result: data?.ketQuaBuoc4,
    );
  }
}
