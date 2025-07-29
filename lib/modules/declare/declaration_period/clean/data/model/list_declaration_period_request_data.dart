class ListDeclarationPeriodRequestData {
  final int periodId;
  final int month;
  final int year;

  const ListDeclarationPeriodRequestData({
    required this.periodId,
    required this.month,
    required this.year,
  });

  Map<String, dynamic> toJson() {
    return {
      'maThuTuc': periodId,
      'thang': month,
      'nam': year,
    };
  }
}
