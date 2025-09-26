import 'staff_detail_data.dart';

class SelectStaffResponseData {
  final List<StaffDetailData>? nhanSus;
  final int? total;

  SelectStaffResponseData({
    this.nhanSus,
    this.total,
  });

  factory SelectStaffResponseData.fromJson(Map<String, dynamic> json) {
    return SelectStaffResponseData(
      nhanSus: (json['nhanSus'] as List<dynamic>? ?? [])
          .map((e) => StaffDetailData.fromJson(e as Map<String, dynamic>))
          .toList(),
      total: json['total'],
    );
  }
}
