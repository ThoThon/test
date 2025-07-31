class ListDeclarationPeriodRequest {
  final int periodId;
  final int month;
  final int year;
  final int? status;

  const ListDeclarationPeriodRequest({
    required this.periodId,
    required this.month,
    required this.year,
    this.status,
  });

  Map<String, dynamic> toJson() {
    return {
      'maThuTuc': periodId,
      'thang': month,
      'nam': year,
      'trangThai': status,
    };
  }
}
