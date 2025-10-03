import 'package:v_bhxh/modules/history/data/model/staff_info_data.dart';

class DeclarationHistoryRecordListData {
  final bool? hasD01;
  final String? d01Id;

  final bool? hasD02;
  final String? d02Id;

  final bool? hasTk1;
  final String? tk1Id;

  final bool? hasOdM01hsb;
  final String? odM01hsbId;

  final bool? hasTsM01hsb;
  final String? tsM01hsbId;

  final bool? hasDsM01hsb;
  final String? dsM01hsbId;

  final bool? hasAttachFile;
  final String? attachPreviewPath;

  final List<StaffInfoData>? staffs;

  DeclarationHistoryRecordListData({
    this.hasD01,
    this.d01Id,
    this.hasD02,
    this.d02Id,
    this.hasTk1,
    this.tk1Id,
    this.hasOdM01hsb,
    this.odM01hsbId,
    this.hasTsM01hsb,
    this.tsM01hsbId,
    this.hasDsM01hsb,
    this.dsM01hsbId,
    this.hasAttachFile,
    this.attachPreviewPath,
    this.staffs,
  });

  factory DeclarationHistoryRecordListData.fromJson(Map<String, dynamic> json) {
    return DeclarationHistoryRecordListData(
      hasD01: json['hasD01'],
      d01Id: json['d01Id'],
      hasD02: json['hasD02'],
      d02Id: json['d02Id'],
      hasTk1: json['hasTk1'],
      tk1Id: json['tk1Id'],
      hasOdM01hsb: json['hasOdM01hsb'],
      odM01hsbId: json['odM01hsbId'],
      hasTsM01hsb: json['hasTsM01hsb'],
      tsM01hsbId: json['tsM01hsbId'],
      hasDsM01hsb: json['hasDsM01hsb'],
      dsM01hsbId: json['dsM01hsbId'],
      hasAttachFile: json['hasAttachFile'],
      attachPreviewPath: json['attachPreviewPath'],
      staffs: (json['staffs'] as List<dynamic>?)
          ?.map((e) => StaffInfoData.fromJson(e))
          .toList(),
    );
  }
}
