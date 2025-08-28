import 'package:v_bhxh/clean/core/domain/entity/entity.dart';
import 'package:v_bhxh/clean/shared/entity/entity_src.dart';
import 'package:v_bhxh/modules/register_code/clean/domain/entity/categories.dart';

import 'social_agency.dart';

class RegisterCodeCategories implements Entity {
  final Set<Province> provinces;
  final Set<SocialAgency> agencies;
  final Set<Categories> receiveMethods;
  final Set<Categories> paymentMethods;
  final Set<Categories> resultReceivingOptions;
  final Set<Categories> objectType;

  const RegisterCodeCategories({
    required this.provinces,
    required this.agencies,
    required this.receiveMethods,
    required this.paymentMethods,
    required this.resultReceivingOptions,
    required this.objectType,
  });
}
