import '../../../../clean/core/domain/entity/entity.dart';
import 'staff_info.dart';

class DeclarationHistoryRecordList implements Entity {
  final bool hasD01;
  final String? d01Id;

  final bool hasD02;
  final String? d02Id;

  final bool hasTk1;
  final String? tk1Id;

  final bool hasOdM01hsb;
  final String? odM01hsbId;

  final bool hasTsM01hsb;
  final String? tsM01hsbId;

  final bool hasDsM01hsb;
  final String? dsM01hsbId;

  final bool hasAttachFile;
  final String? attachPreviewPath;

  final List<StaffInfo>? staffs;

  DeclarationHistoryRecordList({
    required this.hasD01,
    this.d01Id,
    required this.hasD02,
    this.d02Id,
    required this.hasTk1,
    this.tk1Id,
    required this.hasOdM01hsb,
    this.odM01hsbId,
    required this.hasTsM01hsb,
    this.tsM01hsbId,
    required this.hasDsM01hsb,
    this.dsM01hsbId,
    required this.hasAttachFile,
    this.attachPreviewPath,
    required this.staffs,
  });
}
