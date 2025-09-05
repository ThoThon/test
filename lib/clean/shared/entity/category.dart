import 'package:equatable/equatable.dart';
import 'package:v_bhxh/clean/core/domain/entity/entity.dart';

/// Hình thức kê khai phát sinh
const declareMethodArisingValue = '1';

/// Hình thức kê khai điều chỉnh
const declareMethodAdjustValue = '2';

/// Hình thức nhận : ATM
const ATMPaymentValue = 'ATM';

/// Map danh mục:
/// - key là value của Category
/// - value là Category
typedef MapCategory = Map<String, Category>;

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

extension MapCategoryExt on MapCategory {
  List<Category> toList() => values.toList();
}
