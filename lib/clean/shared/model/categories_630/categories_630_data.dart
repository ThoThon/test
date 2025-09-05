import 'package:v_bhxh/clean/shared/model/category_data.dart';

import 'categories_630_src.dart';

class Categories630Data {
  // Hình thức kê khai
  final List<CategoryData>? declareForm;

  // Mã nhóm hưởng 630a
  final Set<BenefitGroup630Data>? benefitGroup630a;

  // Tuyến bệnh viện
  final Set<CategoryData>? hospitalLine;

  // Bệnh dài ngày
  final Set<LongDieaseData>? longDiease;

  // Điều kiện làm việc
  final Set<CategoryData>? workCondition;

  // Hình thức nhận
  final Set<CategoryData>? receiveForm;

  // Ngân hàng
  final Set<BankData>? bank;

  // Mã nhóm hưởng 630b
  final Set<BenefitGroup630Data>? benefitGroup630b;

  // Điều kiện khám thai
  final Set<CategoryData>? pregnancyCondition;

  // Điều kiện sinh con
  final Set<CategoryData>? childBirthCondition;

  // Nghỉ dưỡng thai
  final Set<CategoryData>? maternityLeave;

  // Nghỉ chăm con
  final Set<CategoryData>? parentalLeave;

  // Mang thai hộ
  final Set<CategoryData>? surrogacy;

  // Phẫu thuật hoặc thai dưới 32 tuần
  final Set<CategoryData>? surgeryPregnancy32w;

  // Biện pháp tránh thai
  final Set<CategoryData>? contraception;

  // Mã nhóm hưởng 630c
  final Set<BenefitGroup630Data>? benefitGroup630c;

  Categories630Data({
    this.declareForm,
    this.benefitGroup630a,
    this.hospitalLine,
    this.longDiease,
    this.workCondition,
    this.receiveForm,
    this.bank,
    this.benefitGroup630b,
    this.pregnancyCondition,
    this.childBirthCondition,
    this.maternityLeave,
    this.parentalLeave,
    this.surrogacy,
    this.surgeryPregnancy32w,
    this.contraception,
    this.benefitGroup630c,
  });

  factory Categories630Data.fromJson(Map<String, dynamic> json) {
    return Categories630Data(
      declareForm: (json['phatSinhDieuChinhs'] as List?)
          ?.map((e) => CategoryData.fromJson(e))
          .toList(),
      benefitGroup630a: (json['maNhomHuong630as'] as List?)
          ?.map((e) => BenefitGroup630Data.fromJson630a(e))
          .toSet(),
      hospitalLine: (json['tuyenBenhViens'] as List?)
          ?.map((e) => CategoryData.fromJson(e))
          .toSet(),
      longDiease: (json['benhDaiNgays'] as List?)
          ?.map((e) => LongDieaseData.fromJson(e))
          .toSet(),
      workCondition: (json['dieuKienLamViecs'] as List?)
          ?.map((e) => CategoryData.fromJson(e))
          .toSet(),
      receiveForm: (json['hinhThucNhans'] as List?)
          ?.map((e) => CategoryData.fromJson(e))
          .toSet(),
      bank: (json['nganHangs'] as List?)
          ?.map((e) => BankData.fromJson(e))
          .toSet(),
      benefitGroup630b: (json['maNhomHuong630bs'] as List?)
          ?.map((e) => BenefitGroup630Data.fromJson630b(e))
          .toSet(),
      pregnancyCondition: (json['dieuKienKhamThais'] as List?)
          ?.map((e) => CategoryData.fromJson(e))
          .toSet(),
      childBirthCondition: (json['dieuKienSinhCons'] as List?)
          ?.map((e) => CategoryData.fromJson(e))
          .toSet(),
      maternityLeave: (json['nghiDuongThais'] as List?)
          ?.map((e) => CategoryData.fromJson(e))
          .toSet(),
      parentalLeave: (json['chaNghiChamCons'] as List?)
          ?.map((e) => CategoryData.fromJson(e))
          .toSet(),
      surrogacy: (json['mangThaiHos'] as List?)
          ?.map((e) => CategoryData.fromJson(e))
          .toSet(),
      surgeryPregnancy32w: (json['phauThuatThai32s'] as List?)
          ?.map((e) => CategoryData.fromJson(e))
          .toSet(),
      contraception: (json['bienPhapKHHGDs'] as List?)
          ?.map((e) => CategoryData.fromJson(e))
          .toSet(),
      benefitGroup630c: (json['maNhomHuong630cs'] as List?)
          ?.map((e) => BenefitGroup630Data.fromJson630c(e))
          .toSet(),
    );
  }
}
