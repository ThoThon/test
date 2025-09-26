import 'package:v_bhxh/clean/core/domain/entity/entity.dart';

class StaffDetail implements Entity {
  final String id;
  final String fullName;
  final String bhxhNumber;
  final String cccdNumber;
  final String position;

  StaffDetail({
    required this.id,
    required this.fullName,
    required this.bhxhNumber,
    required this.cccdNumber,
    required this.position,
  });
}
