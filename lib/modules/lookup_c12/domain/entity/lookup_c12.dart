import 'package:v_bhxh/clean/core/domain/entity/entity.dart';

/// Tra cứu C12
class LookupC12 implements Entity {
  final int year;
  final int month;
  final String c12FilePath;

  LookupC12({
    required this.year,
    required this.month,
    required this.c12FilePath,
  });
}
