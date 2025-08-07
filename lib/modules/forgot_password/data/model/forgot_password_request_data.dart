class ForgotPasswordRequestData {
  final String unitCode;
  final String taxCode;

  const ForgotPasswordRequestData({
    required this.unitCode,
    required this.taxCode,
  });

  Map<String, dynamic> toJson() {
    return {
      'maDonVi': unitCode,
      'maSoThue': taxCode,
    };
  }
}
