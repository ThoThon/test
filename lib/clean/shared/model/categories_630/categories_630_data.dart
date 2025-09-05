import 'package:v_bhxh/clean/shared/model/category_data.dart';

import 'categories_630_src.dart';

class Categories630Data {
  // Hình thức kê khai
  final List<CategoryData>? declareForm;

  // Mã nhóm hưởng 630a
  final List<BenefitGroup630Data>? benefitGroup630a;

  // Tuyến bệnh viện
  final List<CategoryData>? hospitalLine;

  // Bệnh dài ngày
  final List<LongDieaseData>? longDiease;

  // Điều kiện làm việc
  final List<CategoryData>? workCondition;

  // Hình thức nhận
  final List<CategoryData>? receiveForm;

  // Ngân hàng
  final List<BankData>? bank;

  // Mã nhóm hưởng 630b
  final List<BenefitGroup630Data>? benefitGroup630b;

  // Điều kiện khám thai
  final List<CategoryData>? pregnancyCondition;

  // Điều kiện sinh con
  final List<CategoryData>? childBirthCondition;

  // Nghỉ dưỡng thai
  final List<CategoryData>? maternityLeave;

  // Nghỉ chăm con
  final List<CategoryData>? parentalLeave;

  // Mang thai hộ
  final List<CategoryData>? surrogacy;

  // Phẫu thuật hoặc thai dưới 32 tuần
  final List<CategoryData>? surgeryPregnancy32w;

  // Biện pháp tránh thai
  final List<CategoryData>? contraception;

  // Mã nhóm hưởng 630c
  final List<BenefitGroup630Data>? benefitGroup630c;

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
          .toList(),
      hospitalLine: (json['tuyenBenhViens'] as List?)
          ?.map((e) => CategoryData.fromJson(e))
          .toList(),
      longDiease: (json['benhDaiNgays'] as List?)
          ?.map((e) => LongDieaseData.fromJson(e))
          .toList(),
      workCondition: (json['dieuKienLamViecs'] as List?)
          ?.map((e) => CategoryData.fromJson(e))
          .toList(),
      receiveForm: (json['hinhThucNhans'] as List?)
          ?.map((e) => CategoryData.fromJson(e))
          .toList(),
      bank: (json['nganHangs'] as List?)
          ?.map((e) => BankData.fromJson(e))
          .toList(),
      benefitGroup630b: (json['maNhomHuong630bs'] as List?)
          ?.map((e) => BenefitGroup630Data.fromJson630b(e))
          .toList(),
      pregnancyCondition: (json['dieuKienKhamThais'] as List?)
          ?.map((e) => CategoryData.fromJson(e))
          .toList(),
      childBirthCondition: (json['dieuKienSinhCons'] as List?)
          ?.map((e) => CategoryData.fromJson(e))
          .toList(),
      maternityLeave: (json['nghiDuongThais'] as List?)
          ?.map((e) => CategoryData.fromJson(e))
          .toList(),
      parentalLeave: (json['chaNghiChamCons'] as List?)
          ?.map((e) => CategoryData.fromJson(e))
          .toList(),
      surrogacy: (json['mangThaiHos'] as List?)
          ?.map((e) => CategoryData.fromJson(e))
          .toList(),
      surgeryPregnancy32w: (json['phauThuatThai32s'] as List?)
          ?.map((e) => CategoryData.fromJson(e))
          .toList(),
      contraception: (json['bienPhapKHHGDs'] as List?)
          ?.map((e) => CategoryData.fromJson(e))
          .toList(),
      benefitGroup630c: (json['maNhomHuong630cs'] as List?)
          ?.map((e) => BenefitGroup630Data.fromJson630c(e))
          .toList(),
    );
  }
}
