import 'package:v_bhxh/clean/core/domain/entity/entity.dart';

class ForgotPasswordRequest implements Entity {
  final String unitCode;
  final String taxCode;

  ForgotPasswordRequest({
    required this.unitCode,
    required this.taxCode,
  });
}
