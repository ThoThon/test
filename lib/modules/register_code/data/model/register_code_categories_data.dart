import 'package:v_bhxh/clean/shared/model/model_src.dart';

import '../../../../clean/shared/model/category_data.dart';
import 'social_agency_data.dart';

class RegisterCodeCategoriesData {
  final List<ProvinceData>? provinces;
  final List<SocialAgencyData>? agencies;
  final List<CategoryData>? receiveMethods;
  final List<CategoryData>? paymentMethods;
  final List<CategoryData>? resultReceivingOptions;
  final List<CategoryData>? objectType;

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
          .toList(),
      agencies: (json['dmCQQLs'] as List<dynamic>?)
          ?.map((e) => SocialAgencyData.fromJson(e))
         .toList(),
      receiveMethods: (json['phuongThucNhans'] as List<dynamic>?)
          ?.map((e) => CategoryData.fromJson(e))
          .toList(),
      paymentMethods: (json['phuongThucDong'] as List<dynamic>?)
          ?.map((e) => CategoryData.fromJson(e))
          .toList(),
      resultReceivingOptions: (json['dangKyNhanKetQuas'] as List<dynamic>?)
          ?.map((e) => CategoryData.fromJson(e))
          .toList(),
      objectType: (json['loaiDoiTuongs'] as List<dynamic>?)
          ?.map((e) => CategoryData.fromJson(e))
          .toList(),
    );
  }
}
