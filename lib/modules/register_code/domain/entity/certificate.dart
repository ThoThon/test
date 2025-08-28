import 'package:v_bhxh/clean/core/domain/entity/entity.dart';

class Certificate implements Entity {
  final int stt;
  final String serialNumber;
  final String name;
  final String validFrom;
  final String validTo;
  final String cerdentialID;
  final String userId;

  Certificate({
    required this.stt,
    required this.serialNumber,
    required this.name,
    required this.validFrom,
    required this.validTo,
    required this.cerdentialID,
    required this.userId,
  });
}
