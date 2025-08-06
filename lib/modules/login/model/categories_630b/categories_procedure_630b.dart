import 'package:v_bhxh/modules/login/model/categories_630b/child_birth_condition_model.dart';
import 'package:v_bhxh/modules/login/model/categories_630b/maternity_leave_model.dart';
import 'package:v_bhxh/modules/login/model/categories_630b/parental_leave_model.dart';
import 'package:v_bhxh/modules/login/model/categories_630b/pregnancy_check_condition_model.dart';

import '../model_src.dart';
import 'contraception_model.dart';
import 'surgery_pregnancy_32w_model.dart';
import 'surrogacy_model.dart';

// TODO: Tạm thời dùng chung model của 630a
// Khi BE gộp chung 2 api vào thì sẽ sửa lại
class CategoriesProcedure630b {
  // Hình thức kê khai
  final Set<DeclareForm630aModel> declareForm;

  // Mã nhóm hưởng
  final Set<BenefitGroup630aModel> benefitGroup;

  // Điều kiện khám thai
  final Set<PregnancyCheckConditionModel> pregnancyCondition;

  // Điều kiện sinh con
  final Set<ChildBirthConditionModel> childBirthCondition;

  // Nghỉ dưỡng thai
  final Set<MaternityLeaveModel> maternityLeave;

  // Nghỉ chăm con
  final Set<ParentalLeaveModel> parentalLeave;

  // Mang thai hộ
  final Set<SurrogacyModel> surrogacy;

  // Phẫu thuật hoặc thai dưới 32 tuần
  final Set<SurgeryPregnancy32wModel> surgeryPregnancy32w;

  // Biện pháp tránh thai
  final Set<ContraceptionModel> contraception;

  // Hình thức nhận
  final Set<ReceiveForm630aModel> receiveForm;

  // Ngân hàng
  final Set<Bank630aModel> bank;

  CategoriesProcedure630b({
    required this.declareForm,
    required this.benefitGroup,
    required this.pregnancyCondition,
    required this.childBirthCondition,
    required this.maternityLeave,
    required this.parentalLeave,
    required this.surrogacy,
    required this.surgeryPregnancy32w,
    required this.contraception,
    required this.receiveForm,
    required this.bank,
  });

  factory CategoriesProcedure630b.fromJson(Map<String, dynamic> json) {
    return CategoriesProcedure630b(
      declareForm: (json['phatSinhDieuChinhs'] as List?)
              ?.map((e) => DeclareForm630aModel.fromJson(e))
              .toSet() ??
          <DeclareForm630aModel>{},
      benefitGroup: (json['maNhomHuongs'] as List?)
              ?.map((e) => BenefitGroup630aModel.fromJson(e))
              .toSet() ??
          <BenefitGroup630aModel>{},
      pregnancyCondition: (json['dieuKienKhamThais'] as List?)
              ?.map((e) => PregnancyCheckConditionModel.fromJson(e))
              .toSet() ??
          <PregnancyCheckConditionModel>{},
      childBirthCondition: (json['dieuKienSinhCons'] as List?)
              ?.map((e) => ChildBirthConditionModel.fromJson(e))
              .toSet() ??
          <ChildBirthConditionModel>{},
      maternityLeave: (json['nghiDuongThais'] as List?)
              ?.map((e) => MaternityLeaveModel.fromJson(e))
              .toSet() ??
          <MaternityLeaveModel>{},
      parentalLeave: (json['chaNghiChamCons'] as List?)
              ?.map((e) => ParentalLeaveModel.fromJson(e))
              .toSet() ??
          <ParentalLeaveModel>{},
      surrogacy: (json['mangThaiHos'] as List?)
              ?.map((e) => SurrogacyModel.fromJson(e))
              .toSet() ??
          <SurrogacyModel>{},
      surgeryPregnancy32w: (json['phauThuatThai32s'] as List?)
              ?.map((e) => SurgeryPregnancy32wModel.fromJson(e))
              .toSet() ??
          <SurgeryPregnancy32wModel>{},
      contraception: (json['bienPhapKHHGDs'] as List?)
              ?.map((e) => ContraceptionModel.fromJson(e))
              .toSet() ??
          <ContraceptionModel>{},
      receiveForm: (json['hinhThucNhans'] as List?)
              ?.map((e) => ReceiveForm630aModel.fromJson(e))
              .toSet() ??
          <ReceiveForm630aModel>{},
      bank: (json['nganHangs'] as List?)
              ?.map((e) => Bank630aModel.fromJson(e))
              .toSet() ??
          <Bank630aModel>{},
    );
  }
}
