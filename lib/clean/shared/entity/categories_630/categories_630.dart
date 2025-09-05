import 'package:v_bhxh/clean/core/domain/entity/entity.dart';
import 'package:v_bhxh/clean/shared/entity/categories_630/categories_630_src.dart';
import 'package:v_bhxh/clean/shared/entity/category.dart';

class Categories630 implements Entity {
  // Hình thức kê khai
  final Set<Category> declareForm;

  // Mã nhóm hưởng 630a
  final Set<BenefitGroup630> benefitGroup630a;

  // Tuyến bệnh viện
  final Set<Category> hospitalLine;

  // Bệnh dài ngày
  final Set<LongDiease> longDiease;

  // Điều kiện làm việc
  final Set<Category> workCondition;

  // Hình thức nhận
  final Set<Category> receiveForm;

  // Ngân hàng
  final Set<Bank> bank;

  // Mã nhóm hưởng 630b
  final Set<BenefitGroup630> benefitGroup630b;

  // Điều kiện khám thai
  final Set<Category> pregnancyCondition;

  // Điều kiện sinh con
  final Set<Category> childBirthCondition;

  // Nghỉ dưỡng thai
  final Set<Category> maternityLeave;

  // Nghỉ chăm con
  final Set<Category> parentalLeave;

  // Mang thai hộ
  final Set<Category> surrogacy;

  // Phẫu thuật hoặc thai dưới 32 tuần
  final Set<Category> surgeryPregnancy32w;

  // Biện pháp tránh thai
  final Set<Category> contraception;

  // Mã nhóm hưởng 630c
  final Set<BenefitGroup630> benefitGroup630c;

  const Categories630({
    required this.declareForm,
    required this.benefitGroup630a,
    required this.hospitalLine,
    required this.longDiease,
    required this.workCondition,
    required this.receiveForm,
    required this.bank,
    required this.benefitGroup630b,
    required this.pregnancyCondition,
    required this.childBirthCondition,
    required this.maternityLeave,
    required this.parentalLeave,
    required this.surrogacy,
    required this.surgeryPregnancy32w,
    required this.contraception,
    required this.benefitGroup630c,
  });
}
