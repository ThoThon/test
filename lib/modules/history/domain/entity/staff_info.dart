import '../../../../clean/core/domain/entity/entity.dart';

class StaffInfo implements Entity {
  final String id;
  final int stt;
  final String name;
  final String bhxhNumber;

  StaffInfo({
    required this.id,
    required this.stt,
    required this.name,
    required this.bhxhNumber,
  });
}
