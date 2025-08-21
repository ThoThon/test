import 'package:v_bhxh/clean/core/domain/entity/entity.dart';
import 'package:v_bhxh/clean/shared/entity/categories_630/categories_630_src.dart';

class CategoriesProcedure630 implements Entity {
  // Hình thức kê khai
  final Set<DeclareForm630> declareForm;

  // Mã nhóm hưởng 630a
  final Set<BenefitGroup630a> benefitGroup630a;

  // Tuyến bệnh viện
  final Set<HospitalLine> hospitalLine;

  // Bệnh dài ngày
  final Set<LongDiease> longDiease;

  // Điều kiện làm việc
  final Set<WorkCondition> workCondition;

  // Hình thức nhận
  final Set<ReceiveForm> receiveForm;

  // Ngân hàng
  final Set<Bank> bank;

  // Mã nhóm hưởng 630b
  final Set<BenefitGroup630b> benefitGroup630b;

  // Mã nhóm hưởng cấp 2
  final Set<BenefitGroupLv2> benefitGroupLv2;

  // Điều kiện khám thai
  final Set<PregnancyCheckCondition> pregnancyCondition;

  // Điều kiện sinh con
  final Set<ChildBirthCondition> childBirthCondition;

  // Nghỉ dưỡng thai
  final Set<MaternityLeave> maternityLeave;

  // Nghỉ chăm con
  final Set<ParentalLeave> parentalLeave;

  // Mang thai hộ
  final Set<Surrogacy> surrogacy;

  // Phẫu thuật hoặc thai dưới 32 tuần
  final Set<SurgeryPregnancy32w> surgeryPregnancy32w;

  // Biện pháp tránh thai
  final Set<Contraception> contraception;

  const CategoriesProcedure630({
    required this.declareForm,
    required this.benefitGroup630a,
    required this.hospitalLine,
    required this.longDiease,
    required this.workCondition,
    required this.receiveForm,
    required this.bank,
    required this.benefitGroup630b,
    required this.benefitGroupLv2,
    required this.pregnancyCondition,
    required this.childBirthCondition,
    required this.maternityLeave,
    required this.parentalLeave,
    required this.surrogacy,
    required this.surgeryPregnancy32w,
    required this.contraception,
  });
}
