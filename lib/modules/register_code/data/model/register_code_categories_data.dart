import 'package:v_bhxh/clean/shared/model/model_src.dart';

import 'categories_data.dart';
import 'social_agency_data.dart';

class RegisterCodeCategoriesData {
  final Set<ProvinceData>? provinces;
  final Set<SocialAgencyData>? agencies;
  final Set<CategoriesData>? receiveMethods;
  final Set<CategoriesData>? paymentMethods;
  final Set<CategoriesData>? resultReceivingOptions;
  final Set<CategoriesData>? objectType;

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
          ?.map((e) => CategoriesData.fromJson(e))
          .toSet(),
      paymentMethods: (json['phuongThucDong'] as List<dynamic>?)
          ?.map((e) => CategoriesData.fromJson(e))
          .toSet(),
      resultReceivingOptions: (json['dangKyNhanKetQuas'] as List<dynamic>?)
          ?.map((e) => CategoriesData.fromJson(e))
          .toSet(),
      objectType: (json['loaiDoiTuongs'] as List<dynamic>?)
          ?.map((e) => CategoriesData.fromJson(e))
          .toSet(),
    );
  }
}
