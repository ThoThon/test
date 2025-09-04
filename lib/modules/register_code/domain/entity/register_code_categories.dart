import 'package:v_bhxh/clean/core/domain/entity/entity.dart';
import 'package:v_bhxh/clean/shared/entity/entity_src.dart';

import '../../../../clean/shared/entity/category.dart';
import 'social_agency.dart';

class RegisterCodeCategories implements Entity {
  final Set<Province> provinces;
  final Set<SocialAgency> agencies;
  final Set<Category> receiveMethods;
  final Set<Category> paymentMethods;
  final Set<Category> resultReceivingOptions;
  final Set<Category> objectType;

  const RegisterCodeCategories({
    required this.provinces,
    required this.agencies,
    required this.receiveMethods,
    required this.paymentMethods,
    required this.resultReceivingOptions,
    required this.objectType,
  });

  factory RegisterCodeCategories.empty() {
    return const RegisterCodeCategories(
      provinces: {},
      agencies: {},
      receiveMethods: {},
      paymentMethods: {},
      resultReceivingOptions: {},
      objectType: {},
    );
  }
}
