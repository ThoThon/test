import '../../login/model/model_src.dart';
import '../../src.dart';

class RegisterCodeCategories {
  final Set<ProvinceModel> provinces;
  final Set<SocialAgencyModel> agencies;
  final Set<ReceiveMethodModel> receiveMethods;
  final Set<PaymentMethodModel> paymentMethods;
  final Set<RegisterReceiveResultModel> resultReceivingOptions;

  const RegisterCodeCategories({
    required this.provinces,
    required this.agencies,
    required this.receiveMethods,
    required this.paymentMethods,
    required this.resultReceivingOptions,
  });

  factory RegisterCodeCategories.fromJson(Map<String, dynamic> json) {
    return RegisterCodeCategories(
      provinces: (json['tinhs'] as List?)
              ?.map((e) => ProvinceModel.fromJson(e))
              .toSet() ??
          <ProvinceModel>{},
      agencies: (json['dmCQQLs'] as List?)
              ?.map((e) => SocialAgencyModel.fromJson(e))
              .toSet() ??
          <SocialAgencyModel>{},
      receiveMethods: (json['phuongThucNhans'] as List?)
              ?.map((e) => ReceiveMethodModel.fromJson(e))
              .toSet() ??
          <ReceiveMethodModel>{},
      paymentMethods: (json['phuongThucDong'] as List?)
              ?.map((e) => PaymentMethodModel.fromJson(e))
              .toSet() ??
          <PaymentMethodModel>{},
      resultReceivingOptions: (json['dangKyNhanKetQuas'] as List?)
              ?.map((e) => RegisterReceiveResultModel.fromJson(e))
              .toSet() ??
          <RegisterReceiveResultModel>{},
    );
  }
}
