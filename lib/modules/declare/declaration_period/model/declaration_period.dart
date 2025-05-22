import 'model_src.dart';

class DeclarationPeriod {
  final String id;
  final String companyId;
  final int procedureId;
  final DeclarationStatus status;
  final int year;
  final int month;
  final int period;
  final bool selected;
  final DateTime? createTime;
  final DateTime? updateDate;
  final bool isApp;
  final int idRef;

  DeclarationPeriod({
    required this.id,
    required this.companyId,
    required this.procedureId,
    required this.status,
    required this.year,
    required this.month,
    required this.period,
    required this.selected,
    this.createTime,
    this.updateDate,
    required this.isApp,
    required this.idRef,
  });

  factory DeclarationPeriod.fromJson(Map<String, dynamic> json) {
    return DeclarationPeriod(
      id: json['id'] ?? '',
      companyId: json['congTyId'] ?? '',
      procedureId: json['maThuTuc'] ?? 0,
      status: DeclarationStatus.fromInt(json['trangThai']),
      year: json['nam'] ?? 0,
      month: json['thang'] ?? 0,
      period: json['dot'] ?? 0,
      selected: json['selected'] ?? false,
      createTime: json['createTime'] != null
          ? DateTime.tryParse(json['createTime'])
          : null,
      updateDate: json['updateDate'] != null
          ? DateTime.tryParse(json['updateDate'])
          : null,
      isApp: json['isApp'] ?? false,
      idRef: json['idRef'] ?? 0,
    );
  }
}
