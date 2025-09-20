import '../../../../../clean/core/domain/entity/entity.dart';

class DeclaredStaff implements Entity {
  final String id;
  final int index;
  final String name;
  final String bhxhNumber;

  const DeclaredStaff({
    required this.id,
    required this.index,
    required this.name,
    required this.bhxhNumber,
  });
}
