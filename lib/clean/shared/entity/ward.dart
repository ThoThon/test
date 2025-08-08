import 'package:equatable/equatable.dart';
import 'package:v_bhxh/clean/core/domain/entity/entity.dart';

class Ward extends Equatable implements Entity {
  final String id;
  final String provinceId;
  final String districtId;
  final String name;

  const Ward({
    required this.id,
    required this.provinceId,
    required this.districtId,
    required this.name,
  });

  @override
  List<Object?> get props => [id, provinceId, districtId, name];
}
