import 'package:v_bhxh/clean/shared/model/model_src.dart';

import 'categories_data.dart';
import 'social_agency_data.dart';

class RegisterCodeCategoriesData {
  final Set<ProvinceData>? provinces;
  final Set<SocialAgencyData>? agencies;
  final Set<CategoryData>? receiveMethods;
  final Set<CategoryData>? paymentMethods;
  final Set<CategoryData>? resultReceivingOptions;
  final Set<CategoryData>? objectType;

  const RegisterCodeCategoriesData({
    this.provinces,
    this.agencies,
    this.receiveMethods,
    this.paymentMethods,
    this.resultReceivingOptions,
    this.objectType,
  });

  factory RegisterCodeCategoriesData.fromJson(Map<String, dynamic> json) {
    return RegisterCodeCategoriesData(
      provinces: (json['tinhs'] as List<dynamic>?)
          ?.map((e) => ProvinceData.fromJson(e))
          .toSet(),
      agencies: (json['dmCQQLs'] as List<dynamic>?)
          ?.map((e) => SocialAgencyData.fromJson(e))
          .toSet(),
      receiveMethods: (json['phuongThucNhans'] as List<dynamic>?)
          ?.map((e) => CategoryData.fromJson(e))
          .toSet(),
      paymentMethods: (json['phuongThucDong'] as List<dynamic>?)
          ?.map((e) => CategoryData.fromJson(e))
          .toSet(),
      resultReceivingOptions: (json['dangKyNhanKetQuas'] as List<dynamic>?)
          ?.map((e) => CategoryData.fromJson(e))
          .toSet(),
      objectType: (json['loaiDoiTuongs'] as List<dynamic>?)
          ?.map((e) => CategoryData.fromJson(e))
          .toSet(),
    );
  }
}
