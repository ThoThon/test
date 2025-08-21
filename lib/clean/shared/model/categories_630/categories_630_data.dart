import 'categories_630_src.dart';

class Categories630Data {
  // Hình thức kê khai
  final Set<DeclareForm630Data>? declareForm;

  // Mã nhóm hưởng 630a
  final Set<BenefitGroup630aData>? benefitGroup630a;

  // Tuyến bệnh viện
  final Set<HospitalLineData>? hospitalLine;

  // Bệnh dài ngày
  final Set<LongDieaseData>? longDiease;

  // Điều kiện làm việc
  final Set<WorkConditionData>? workCondition;

  // Hình thức nhận
  final Set<ReceiveFormData>? receiveForm;

  // Ngân hàng
  final Set<BankData>? bank;

  // Mã nhóm hưởng 630b
  final Set<BenefitGroup630bData>? benefitGroup630b;

  // Mã nhóm hưởng cấp 2
  final Set<BenefitGroupLv2Data>? benefitGroupLv2;

  // Điều kiện khám thai
  final Set<PregnancyCheckConditionData>? pregnancyCondition;

  // Điều kiện sinh con
  final Set<ChildBirthConditionData>? childBirthCondition;

  // Nghỉ dưỡng thai
  final Set<MaternityLeaveData>? maternityLeave;

  // Nghỉ chăm con
  final Set<ParentalLeaveData>? parentalLeave;

  // Mang thai hộ
  final Set<SurrogacyData>? surrogacy;

  // Phẫu thuật hoặc thai dưới 32 tuần
  final Set<SurgeryPregnancy32wData>? surgeryPregnancy32w;

  // Biện pháp tránh thai
  final Set<ContraceptionData>? contraception;

  Categories630Data({
    this.declareForm,
    this.benefitGroup630a,
    this.hospitalLine,
    this.longDiease,
    this.workCondition,
    this.receiveForm,
    this.bank,
    this.benefitGroup630b,
    this.benefitGroupLv2,
    this.pregnancyCondition,
    this.childBirthCondition,
    this.maternityLeave,
    this.parentalLeave,
    this.surrogacy,
    this.surgeryPregnancy32w,
    this.contraception,
  });

  factory Categories630Data.fromJson(Map<String, dynamic> json) {
    return Categories630Data(
      declareForm: (json['phatSinhDieuChinhs'] as List?)
          ?.map((e) => DeclareForm630Data.fromJson(e))
          .toSet(),
      benefitGroup630a: (json['maNhomHuong630as'] as List?)
          ?.map((e) => BenefitGroup630aData.fromJson(e))
          .toSet(),
      hospitalLine: (json['tuyenBenhViens'] as List?)
          ?.map((e) => HospitalLineData.fromJson(e))
          .toSet(),
      longDiease: (json['benhDaiNgays'] as List?)
          ?.map((e) => LongDieaseData.fromJson(e))
          .toSet(),
      workCondition: (json['dieuKienLamViecs'] as List?)
          ?.map((e) => WorkConditionData.fromJson(e))
          .toSet(),
      receiveForm: (json['hinhThucNhans'] as List?)
          ?.map((e) => ReceiveFormData.fromJson(e))
          .toSet(),
      bank: (json['nganHangs'] as List?)
          ?.map((e) => BankData.fromJson(e))
          .toSet(),
      benefitGroup630b: (json['maNhomHuong630bs'] as List?)
          ?.map((e) => BenefitGroup630bData.fromJson(e))
          .toSet(),
      benefitGroupLv2: (json['maNhomHuong2s'] as List?)
          ?.map((e) => BenefitGroupLv2Data.fromJson(e))
          .toSet(),
      pregnancyCondition: (json['dieuKienKhamThais'] as List?)
          ?.map((e) => PregnancyCheckConditionData.fromJson(e))
          .toSet(),
      childBirthCondition: (json['dieuKienSinhCons'] as List?)
          ?.map((e) => ChildBirthConditionData.fromJson(e))
          .toSet(),
      maternityLeave: (json['nghiDuongThais'] as List?)
          ?.map((e) => MaternityLeaveData.fromJson(e))
          .toSet(),
      parentalLeave: (json['chaNghiChamCons'] as List?)
          ?.map((e) => ParentalLeaveData.fromJson(e))
          .toSet(),
      surrogacy: (json['mangThaiHos'] as List?)
          ?.map((e) => SurrogacyData.fromJson(e))
          .toSet(),
      surgeryPregnancy32w: (json['phauThuatThai32s'] as List?)
          ?.map((e) => SurgeryPregnancy32wData.fromJson(e))
          .toSet(),
      contraception: (json['bienPhapKHHGDs'] as List?)
          ?.map((e) => ContraceptionData.fromJson(e))
          .toSet(),
    );
  }
}
