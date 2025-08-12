import 'package:equatable/equatable.dart';

/// Mã nhóm hưởng cấp 2
class BenefitGroupLv2Model extends Equatable {
  final String maNhomHuong;
  final String maNhomHuongC2;
  final String tenNhomHuongC2;

  const BenefitGroupLv2Model({
    required this.maNhomHuong,
    required this.maNhomHuongC2,
    required this.tenNhomHuongC2,
  });

  factory BenefitGroupLv2Model.fromJson(Map<String, dynamic> json) {
    return BenefitGroupLv2Model(
      maNhomHuong: json['maNhomHuong'] ?? '',
      maNhomHuongC2: json['maNhomHuongC2'] ?? '',
      tenNhomHuongC2: json['tenNhomHuongC2'] ?? '',
    );
  }

  @override
  List<Object?> get props => [
        maNhomHuong,
        maNhomHuongC2,
        tenNhomHuongC2,
      ];
}
