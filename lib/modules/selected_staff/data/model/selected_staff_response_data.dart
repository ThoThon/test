import 'staff_info_data.dart';

class SelectStaffResponseData {
  final List<StaffInfoData>? nhanSus;
  final int? total;

  SelectStaffResponseData({
    this.nhanSus,
    this.total,
  });

  factory SelectStaffResponseData.fromJson(Map<String, dynamic> json) {
    return SelectStaffResponseData(
      nhanSus: (json['nhanSus'] as List<dynamic>? ?? [])
          .map((e) => StaffInfoData.fromJson(e as Map<String, dynamic>))
          .toList(),
      total: json['total'],
    );
  }
}
