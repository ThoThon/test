import 'attach_image_607_model.dart';
import 'declared_staff_607_model.dart';

class StaffList607Response {
  final List<DeclaredStaff607Model> staffs;
  final List<AttachImage607Model> image;

  StaffList607Response({
    required this.staffs,
    required this.image,
  });

  factory StaffList607Response.fromJson(Map<String, dynamic> json) {
    return StaffList607Response(
      staffs: (json['d02Results'] as List<dynamic>?)
              ?.map((e) =>
                  DeclaredStaff607Model.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      image: (json['attachImages'] as List<dynamic>?)
              ?.map((e) =>
                  AttachImage607Model.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );
  }
}
