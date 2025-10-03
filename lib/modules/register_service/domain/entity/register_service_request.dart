import 'package:v_bhxh/clean/core/domain/entity/entity.dart';

class RegisterServiceRequest implements Entity{
  final String userId;
  final String credentialID;

  RegisterServiceRequest({
    required this.userId,
    required this.credentialID,
  });
}
