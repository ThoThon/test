class DeclarationPeriodData {
  final String? id;

  /// Mã công ty
  final String? companyId;

  /// Mã thủ tục
  final int? procedureId;

  /// Trạng thái hồ sơ
  ///
  /// - Web dùng `trangThai`
  /// - App dùng `trangThaiHoSo`
  final int? status;
  final int? year;
  final int? month;
  final int? period;
  final bool? selected;
  final String? createTime;
  final String? updateDate;

  /// Số hồ sơ
  final String? fileNumber;

  const DeclarationPeriodData({
    this.id,
    this.companyId,
    this.procedureId,
    this.status,
    this.year,
    this.month,
    this.period,
    this.selected,
    this.createTime,
    this.updateDate,
    this.fileNumber,
  });

  factory DeclarationPeriodData.fromJson(Map<String, dynamic> json) {
    return DeclarationPeriodData(
      id: json['id'],
      companyId: json['congTyId'],
      procedureId: json['maThuTuc'],
      status: json['trangThaiHoSo'],
      year: json['nam'],
      month: json['thang'],
      period: json['dot'],
      selected: json['selected'],
      createTime: json['createTime'],
      updateDate: json['updateTime'],
      fileNumber: json['soHoSo'],
    );
  }
}
