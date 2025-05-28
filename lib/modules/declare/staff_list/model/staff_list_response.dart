import 'declared_staff_model.dart';

class StaffListResponse {
  final List<DeclaredStaffModel> staffs;

  const StaffListResponse({
    required this.staffs,
  });

  factory StaffListResponse.fromJson(Map<String, dynamic> json) {
    return StaffListResponse(
      staffs: (json['d02Results'] as List<dynamic>?)
              ?.map(
                  (e) => DeclaredStaffModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );
  }
}
