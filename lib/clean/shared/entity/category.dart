import 'package:equatable/equatable.dart';
import 'package:v_bhxh/clean/core/domain/entity/entity.dart';

class Category extends Equatable implements Entity {
  final String value;
  final String text;

  const Category({
    required this.value,
    required this.text,
  });

  @override
  List<Object?> get props => [
        value,
        text,
      ];
}
