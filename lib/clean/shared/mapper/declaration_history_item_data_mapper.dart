import 'package:v_bhxh/clean/shared/mapper/mapper_src.dart';
import 'package:v_bhxh/modules/history/data/model/declaration_history_item_data.dart';
import 'package:v_bhxh/modules/history/domain/entity/declaration_history_item.dart';
import 'package:v_bhxh/modules/history/domain/entity/declaration_history_step.dart';

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
      steps: [
        DeclarationHistoryStep(
          status: data?.trangThaiBuoc1 ?? false,
          result: data?.ketQuaBuoc1 ?? '',
        ),
        DeclarationHistoryStep(
          status: data?.trangThaiBuoc2 ?? false,
          result: data?.ketQuaBuoc2 ?? '',
        ),
        DeclarationHistoryStep(
          status: data?.trangThaiBuoc3 ?? false,
          result: data?.ketQuaBuoc3 ?? '',
        ),
        DeclarationHistoryStep(
          status: data?.trangThaiBuoc4 ?? false,
          result: data?.ketQuaBuoc4 ?? '',
        ),
      ],
    );
  }
}
