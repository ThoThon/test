import 'package:v_bhxh/modules/declare/staff_list/data/model/attached_image_data.dart';
import 'package:v_bhxh/modules/declare/staff_list/data/model/declared_staff_data.dart';

class StaffListData {
  final List<DeclaredStaffData>? staffs;
  final List<AttachedImageData>? images;

  StaffListData({
    this.staffs,
    this.images,
  });

  factory StaffListData.fromJsonD02(Map<String, dynamic> json) {
    return StaffListData(
      staffs: (json['d02Results'] as List<dynamic>?)
          ?.map((e) => DeclaredStaffData.fromJson(e as Map<String, dynamic>))
          .toList(),
      images: (json['attachImages'] as List<dynamic>?)
          ?.map((e) => AttachedImageData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  factory StaffListData.fromJsonTk1(Map<String, dynamic> json) {
    return StaffListData(
      staffs: (json['tk1Results'] as List<dynamic>?)
          ?.map((e) => DeclaredStaffData.fromJson(e as Map<String, dynamic>))
          .toList(),
      images: (json['attachImages'] as List<dynamic>?)
          ?.map((e) => AttachedImageData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  factory StaffListData.fromJson630b(Map<String, dynamic> json) {
    return StaffListData(
      staffs: (json['results'] as List<dynamic>?)
          ?.map((e) => DeclaredStaffData.fromJson(e as Map<String, dynamic>))
          .toList(),
      images: (json['attachImages'] as List<dynamic>?)
          ?.map((e) => AttachedImageData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}
