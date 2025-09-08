import 'package:v_bhxh/clean/core/domain/entity/entity.dart';
import 'package:v_bhxh/clean/shared/entity/categories_630/categories_630_src.dart';
import 'package:v_bhxh/clean/shared/entity/category.dart';

class Categories630 implements Entity {
  // Hình thức kê khai
  final MapCategory declareForm;

  // Mã nhóm hưởng 630a
  final Set<BenefitGroup630> benefitGroup630a;

  // Tuyến bệnh viện
  final MapCategory hospitalLine;

  // Bệnh dài ngày
  final Set<LongDiease> longDiease;

  // Điều kiện làm việc
  final MapCategory workCondition;

  // Hình thức nhận
  final MapCategory receiveForm;

  // Ngân hàng
  final Set<Bank> bank;

  // Mã nhóm hưởng 630b
  final Set<BenefitGroup630> benefitGroup630b;

  // Điều kiện khám thai
  final MapCategory pregnancyCondition;

  // Điều kiện sinh con
  final MapCategory childBirthCondition;

  // Nghỉ dưỡng thai
  final MapCategory maternityLeave;

  // Nghỉ chăm con
  final MapCategory parentalLeave;

  // Mang thai hộ
  final MapCategory surrogacy;

  // Phẫu thuật hoặc thai dưới 32 tuần
  final MapCategory surgeryPregnancy32w;

  // Biện pháp tránh thai
  final MapCategory contraception;

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
