import 'package:equatable/equatable.dart';
import 'package:v_bhxh/clean/core/domain/entity/entity.dart';

class District extends Equatable implements Entity {
  final String id;
  final String provinceId;
  final String name;

  const District({
    required this.id,
    required this.provinceId,
    required this.name,
  });

  @override
  List<Object?> get props => [id, provinceId, name];
}
