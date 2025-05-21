import 'model_src.dart';

class DeclarationPeriodModel {
  final String id;
  final String congTyId;
  final int maThuTuc;
  final DeclarationStatus trangThai;
  final int nam;
  final int thang;
  final int dot;
  final bool selected;
  final DateTime? createTime;
  final DateTime? updateDate;
  final bool isApp;
  final int idRef;

  DeclarationPeriodModel({
    required this.id,
    required this.congTyId,
    required this.maThuTuc,
    required this.trangThai,
    required this.nam,
    required this.thang,
    required this.dot,
    required this.selected,
    this.createTime,
    this.updateDate,
    required this.isApp,
    required this.idRef,
  });

  factory DeclarationPeriodModel.fromJson(Map<String, dynamic> json) {
    return DeclarationPeriodModel(
      id: json['id'] ?? '',
      congTyId: json['congTyId'] ?? '',
      maThuTuc: json['maThuTuc'] ?? 0,
      trangThai: DeclarationStatus.fromInt(json['trangThai']),
      nam: json['nam'] ?? 0,
      thang: json['thang'] ?? 0,
      dot: json['dot'] ?? 0,
      selected: json['selected'] ?? false,
      createTime: DateTime.tryParse(json['createTime'] ?? ''),
      updateDate: DateTime.tryParse(json['updateDate'] ?? ''),
      isApp: json['isApp'] ?? false,
      idRef: json['idRef'] ?? 0,
    );
  }
}
