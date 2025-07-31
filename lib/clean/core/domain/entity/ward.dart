import 'package:equatable/equatable.dart';

class Ward extends Equatable {
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
