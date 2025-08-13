import 'package:v_bhxh/modules/login/model/categories_630/categories_630_src.dart';

class CategoriesProcedure630 {
  // Hình thức kê khai
  final Set<DeclareForm630Model> declareForm;

  // Mã nhóm hưởng 630a
  final Set<BenefitGroup630aModel> benefitGroup630a;

  // Tuyến bệnh viện
  final Set<HospitalLineModel> hospitalLine;

  // Bệnh dài ngày
  final Set<LongDieaseModel> longDiease;

  // Điều kiện làm việc
  final Set<WorkConditionModel> workCondition;

  // Hình thức nhận
  final Set<ReceiveFormModel> receiveForm;

  // Ngân hàng
  final Set<BankModel> bank;

  // Mã nhóm hưởng 630b
  final Set<BenefitGroup630bModel> benefitGroup630b;

  // Mã nhóm hưởng cấp 2
  final Set<BenefitGroupLv2Model> benefitGroupLv2;

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

  factory CategoriesProcedure630.fromJson(Map<String, dynamic> json) {
    return CategoriesProcedure630(
      declareForm: (json['phatSinhDieuChinhs'] as List?)
              ?.map((e) => DeclareForm630Model.fromJson(e))
              .toSet() ??
          <DeclareForm630Model>{},
      benefitGroup630a: (json['maNhomHuong630as'] as List?)
              ?.map((e) => BenefitGroup630aModel.fromJson(e))
              .toSet() ??
          <BenefitGroup630aModel>{},
      hospitalLine: (json['tuyenBenhViens'] as List?)
              ?.map((e) => HospitalLineModel.fromJson(e))
              .toSet() ??
          <HospitalLineModel>{},
      longDiease: (json['benhDaiNgays'] as List?)
              ?.map((e) => LongDieaseModel.fromJson(e))
              .toSet() ??
          <LongDieaseModel>{},
      workCondition: (json['dieuKienLamViecs'] as List?)
              ?.map((e) => WorkConditionModel.fromJson(e))
              .toSet() ??
          <WorkConditionModel>{},
      receiveForm: (json['hinhThucNhans'] as List?)
              ?.map((e) => ReceiveFormModel.fromJson(e))
              .toSet() ??
          <ReceiveFormModel>{},
      bank: (json['nganHangs'] as List?)
              ?.map((e) => BankModel.fromJson(e))
              .toSet() ??
          <BankModel>{},
      benefitGroup630b: (json['maNhomHuong630bs'] as List?)
              ?.map((e) => BenefitGroup630bModel.fromJson(e))
              .toSet() ??
          <BenefitGroup630bModel>{},
      benefitGroupLv2: (json['maNhomHuong2s'] as List?)
              ?.map((e) => BenefitGroupLv2Model.fromJson(e))
              .toSet() ??
          <BenefitGroupLv2Model>{},
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
    );
  }
}
