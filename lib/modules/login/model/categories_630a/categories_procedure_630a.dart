import 'categories_630a_src.dart';

class CategoriesProcedure630a {
  // Hình thức kê khai
  final Set<DeclareForm630aModel> declareForm;
  // Mã nhóm hưởng
  final Set<BenefitGroup630aModel> benefitGroup;
  // Điều kiện làm việc
  final Set<WorkCondition630aModel> workCondition;
  // Hình thức nhận
  final Set<ReceiveForm630aModel> receiveForm;
  // Tuyến bệnh viện
  final Set<HospitalLine630aModel> hospitalLine;
  // Bệnh dài ngày
  final Set<LongDiease630aModel> longDiease;
  // Ngân hàng
  final Set<Bank630aModel> bank;

  CategoriesProcedure630a({
    required this.declareForm,
    required this.benefitGroup,
    required this.workCondition,
    required this.receiveForm,
    required this.hospitalLine,
    required this.longDiease,
    required this.bank,
  });

  factory CategoriesProcedure630a.fromJson(Map<String, dynamic> json) {
    return CategoriesProcedure630a(
      declareForm: (json['phatSinhDieuChinhs'] as List?)
              ?.map((e) => DeclareForm630aModel.fromJson(e))
              .toSet() ??
          <DeclareForm630aModel>{},
      benefitGroup: (json['maNhomHuongs'] as List?)
              ?.map((e) => BenefitGroup630aModel.fromJson(e))
              .toSet() ??
          <BenefitGroup630aModel>{},
      workCondition: (json['dieuKienLamViecs'] as List?)
              ?.map((e) => WorkCondition630aModel.fromJson(e))
              .toSet() ??
          <WorkCondition630aModel>{},
      receiveForm: (json['hinhThucNhans'] as List?)
              ?.map((e) => ReceiveForm630aModel.fromJson(e))
              .toSet() ??
          <ReceiveForm630aModel>{},
      hospitalLine: (json['tuyenBenhViens'] as List?)
              ?.map((e) => HospitalLine630aModel.fromJson(e))
              .toSet() ??
          <HospitalLine630aModel>{},
      longDiease: (json['benhDaiNgays'] as List?)
              ?.map((e) => LongDiease630aModel.fromJson(e))
              .toSet() ??
          <LongDiease630aModel>{},
      bank: (json['nganHangs'] as List?)
              ?.map((e) => Bank630aModel.fromJson(e))
              .toSet() ??
          <Bank630aModel>{},
    );
  }
}
