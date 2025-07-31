class CreateDeclarationPeriodRequestData {
  final int maThuTuc;
  final int nam;
  final int thang;

  const CreateDeclarationPeriodRequestData({
    required this.maThuTuc,
    required this.nam,
    required this.thang,
  });

  Map<String, dynamic> toJson() {
    return {
      'maThuTuc': maThuTuc,
      'nam': nam,
      'thang': thang,
    };
  }
}
