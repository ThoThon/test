import 'attach_image_model.dart';
import 'declared_staff_model.dart';

class StaffListResponse {
  final List<DeclaredStaffModel> staffs;
  final List<AttachImageModel>? image;

  StaffListResponse({
    required this.staffs,
    this.image,
  });

  factory StaffListResponse.fromJson(Map<String, dynamic> json) {
    return StaffListResponse(
      staffs: (json['d02Results'] as List<dynamic>?)
              ?.map(
                  (e) => DeclaredStaffModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      image: (json['attachImages'] as List<dynamic>?)
              ?.map((e) => AttachImageModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );
  }
}
