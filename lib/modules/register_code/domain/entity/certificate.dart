import 'package:equatable/equatable.dart';
import 'package:v_bhxh/clean/core/domain/entity/entity.dart';

class Certificate extends Equatable implements Entity {
  final int stt;
  final String serialNumber;
  final String name;
  final String validFrom;
  final String validTo;
  final String cerdentialID;
  final String userId;

  const Certificate({
    required this.stt,
    required this.serialNumber,
    required this.name,
    required this.validFrom,
    required this.validTo,
    required this.cerdentialID,
    required this.userId,
  });

  @override
  List<Object?> get props => [
        stt,
        serialNumber,
        name,
        validFrom,
        validTo,
        cerdentialID,
        userId,
      ];
}
