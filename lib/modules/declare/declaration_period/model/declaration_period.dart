import 'model_src.dart';

class DeclarationPeriod {
  final String id;

  /// Mã công ty
  final String companyId;

  /// Mã thủ tục
  final int procedureId;

  /// Trạng thái hồ sơ
  ///
  /// - Web dùng `trangThai`
  /// - App dùng `trangThaiHoSo`
  final DeclarationStatus status;
  final int year;
  final int month;
  final int period;
  final bool selected;
  final DateTime? createTime;
  final DateTime? updateDate;

  /// Số hồ sơ
  final String? fileNumber;

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
    this.fileNumber,
  });

  factory DeclarationPeriod.fromJson(Map<String, dynamic> json) {
    return DeclarationPeriod(
      id: json['id'] ?? '',
      companyId: json['congTyId'] ?? '',
      procedureId: json['maThuTuc'] ?? 0,
      status: DeclarationStatus.fromInt(json['trangThaiHoSo']),
      year: json['nam'] ?? 0,
      month: json['thang'] ?? 0,
      period: json['dot'] ?? 0,
      selected: json['selected'] ?? false,
      createTime: DateTime.tryParse(json['createTime'] ?? ''),
      updateDate: DateTime.tryParse(json['updateTime'] ?? ''),
      fileNumber: json['soHoSo'],
    );
  }

  /// Loại thủ tục của kỳ khai báo
  ProcedureType get type {
    return ProcedureType.fromInt(procedureId);
  }
}
