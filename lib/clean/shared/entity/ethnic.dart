import 'package:equatable/equatable.dart';
import 'package:v_bhxh/clean/core/domain/entity/entity.dart';

/// Dân tộc
class Ethnic extends Equatable implements Entity {
  final int value;
  final String text;

  const Ethnic({
    required this.value,
    required this.text,
  });

  @Deprecated('Sử dụng EthnicData để parse Json')
  factory Ethnic.fromJson(Map<String, dynamic> json) {
    return Ethnic(
      value: int.tryParse(json['value'].toString()) ?? 0,
      text: json['text'] ?? '',
    );
  }

  @override
  List<Object?> get props => [value, text];
}
