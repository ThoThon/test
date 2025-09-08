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

  // TODO: Xóa sau khi chuyển đổi xong sang clean architecture
  factory District.fromJson(Map<String, dynamic> json) {
    return District(
      id: json['maHuyen'] ?? '',
      provinceId: json['maTinh'] ?? '',
      name: json['tenHuyen'] ?? '',
    );
  }

  @override
  List<Object?> get props => [id, provinceId, name];
}
