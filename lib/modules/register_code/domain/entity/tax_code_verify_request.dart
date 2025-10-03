import 'package:v_bhxh/clean/core/domain/entity/entity.dart';

class TaxCodeVerifyRequest implements Entity{
  final String taxCode;
  final String userId;
  final String credentialID;

  TaxCodeVerifyRequest({
    required this.taxCode,
    required this.userId,
    required this.credentialID,
  });
}
