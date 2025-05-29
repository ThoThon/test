import 'package:v_bhxh/modules/select_staff/model/select_staff_response.dart';

class StaffListResponse {
  final List<SelectStaffResponse> nhanSus;
  final int total;

  StaffListResponse({
    required this.nhanSus,
    required this.total,
  });

  factory StaffListResponse.fromJson(Map<String, dynamic> json) {
    return StaffListResponse(
      nhanSus: (json['nhanSus'] as List<dynamic>? ?? [])
          .map((e) => SelectStaffResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      total: json['total'] ?? 0,
    );
  }
}
