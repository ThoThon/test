import 'model_src.dart';

class DeclarationPeriod {
  final String id;

  /// Mã công ty
  final String companyId;

  /// Mã thủ tục
  final int procedureId;

  /// Trạng thái đợt
  final PeriodStatus periodStatus;

  /// Trạng thái hồ sơ
  final FileStatus fileStatus;
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
    required this.periodStatus,
    required this.fileStatus,
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
      periodStatus: PeriodStatus.fromInt(json['trangThai'] ?? ''),
      fileStatus: FileStatus.fromInt(json['trangThaiHoSo'] ?? ''),
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
  ProcedureType get procedureType {
    return ProcedureType.fromInt(procedureId);
  }

  bool isCanEditAndDelete() {
    // Nếu 'trangThai' trả về 0,1 luôn cho phép xóa, chỉnh sửa
    if (periodStatus != PeriodStatus.sent) {
      return true;
    } else {
      // Nếu 'trangThaiHoSo' trả về 1 trong 3,4,5,6 thì không cho phép chỉnh sửa nữa
      if (fileStatus.index >= 3 && fileStatus.index <= 6) {
        return false;
      } else {
        return true;
      }
    }
  }
}
