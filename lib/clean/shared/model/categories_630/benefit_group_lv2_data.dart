/// Mã nhóm hưởng cấp 2
class BenefitGroupLv2Data {
  final String? maNhomHuong;
  final String? maNhomHuongC2;
  final String? tenNhomHuongC2;

  const BenefitGroupLv2Data({
    this.maNhomHuong,
    this.maNhomHuongC2,
    this.tenNhomHuongC2,
  });

  factory BenefitGroupLv2Data.fromJson(Map<String, dynamic> json) {
    return BenefitGroupLv2Data(
      maNhomHuong: json['maNhomHuong'],
      maNhomHuongC2: json['maNhomHuongC2'],
      tenNhomHuongC2: json['tenNhomHuongC2'],
    );
  }
}
