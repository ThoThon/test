import 'package:get/get.dart';
import 'package:v_bhxh/generated/locales.g.dart';
import 'package:v_bhxh/modules/declare/declare_info/model/model_src.dart';

enum DeclarationTypeEnum {
  /// Tăng lao động
  increaseLabor,

  /// Giảm lao động
  decreaseLabor,

  /// Tăng lương
  increaseSalary,

  /// Giảm lương
  decreaseSalary,

  /// Khác
  other;

  String get title {
    switch (this) {
      case increaseLabor:
        return LocaleKeys.declareInfo_declarationTypeIncreaseLabor.tr;
      case decreaseLabor:
        return LocaleKeys.declareInfo_declarationTypeDecreaseLabor.tr;
      case increaseSalary:
        return LocaleKeys.declareInfo_declarationTypeIncreaseSalary.tr;
      case decreaseSalary:
        return LocaleKeys.declareInfo_declarationTypeDecreaseSalary.tr;
      case other:
        return LocaleKeys.declareInfo_declarationTypeOther.tr;
    }
  }

  List<PlanEnum> get plans {
    switch (this) {
      case increaseLabor:
        return PlanEnum.increaseLaborPlans;
      case decreaseLabor:
        return PlanEnum.decreaseLaborPlans;
      case increaseSalary:
        return PlanEnum.increaseSalaryPlans;
      case decreaseSalary:
        return PlanEnum.decreaseSalaryPlans;
      case other:
        return PlanEnum.otherPlans;
    }
  }
}
