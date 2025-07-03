import 'package:v_bhxh/modules/src.dart';

class D02Request {
  final String? id;
  final String? kyKeKhaiId;
  final String? hoTen;
  final String? maSoBhxh;
  final int loaiHoSo;
  final String? phuongAnId;
  final bool xuatTk01;
  final String? cmnd;
  final int chiCoNamSinh;
  final DateTime? ngaySinh;
  final int gioiTinh;
  final int? danTocId;
  final String? quocTichId;
  final String? tuThang;
  final String? denThang;
  final String? chucVu;
  final String? noiLamViec;
  final bool dongTheoHeSo;
  final String? tienLuong;
  final double? phuCapChucVu;
  final double? phuCapThamNienVuotKhung;
  final double? phuCapThamNienNghe;
  final String? phuCapLuong;
  final String? phuCapBoSung;
  final String? ghiChu;
  final bool xuatD01;

  const D02Request({
    this.id,
    this.kyKeKhaiId,
    this.hoTen,
    this.maSoBhxh,
    required this.loaiHoSo,
    this.phuongAnId,
    required this.xuatTk01,
    this.cmnd,
    required this.chiCoNamSinh,
    this.ngaySinh,
    required this.gioiTinh,
    this.danTocId,
    this.quocTichId,
    this.tuThang,
    this.denThang,
    this.chucVu,
    this.noiLamViec,
    required this.dongTheoHeSo,
    this.tienLuong,
    this.phuCapChucVu,
    this.phuCapThamNienVuotKhung,
    this.phuCapThamNienNghe,
    this.phuCapLuong,
    this.phuCapBoSung,
    this.ghiChu,
    required this.xuatD01,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'kyKeKhaiId': kyKeKhaiId,
      'hoTen': hoTen,
      'maSoBhxh': maSoBhxh,
      'loaiHoSo': loaiHoSo,
      'phuongAnId': phuongAnId,
      'xuatTk01': xuatTk01,
      'cmnd': cmnd,
      'chiCoNamSinh': chiCoNamSinh,
      'ngaySinh': ngaySinh?.toIso8601String(),
      'gioiTinh': gioiTinh,
      'danTocId': danTocId,
      'quocTichId': quocTichId,
      'tuThang': tuThang,
      'denThang': denThang,
      'chucVu': chucVu,
      'noiLamViec': noiLamViec,
      'dongTheoHeSo': dongTheoHeSo,
      'tienLuong': tienLuong,
      'phuCapChucVu': phuCapChucVu,
      'phuCapThamNienVuotKhung': phuCapThamNienVuotKhung,
      'phuCapThamNienNghe': phuCapThamNienNghe,
      'phuCapLuong': phuCapLuong,
      'phuCapBoSung': phuCapBoSung,
      'ghiChu': ghiChu,
      'xuatD01': xuatD01,
    };
  }

  static D02Request fromState({
    required String kyKeKhaiId,
    required D02Tk1State d02Tk1State,
    required D02State d02State,
  }) {
    return D02Request(
      id: d02State.id,
      kyKeKhaiId: kyKeKhaiId,
      hoTen: d02Tk1State.fullNameTextCtrl.text.trim(),
      maSoBhxh: d02Tk1State.bhxhTextCtrl.text.trim(),
      loaiHoSo: d02State.declarationType.value?.value ?? 0,
      phuongAnId: d02State.plan.value?.id,
      xuatTk01: d02State.isGenerateTk1Data.value,
      cmnd: d02Tk1State.cccdTextCtrl.text.trim(),
      chiCoNamSinh: d02Tk1State.birthType.value.rawValue,
      ngaySinh: convertStringToDateSafe(d02Tk1State.dateOfBirthTextCtrl.text,
          d02Tk1State.birthType.value.pattern),
      gioiTinh: d02Tk1State.gender.value.rawValue,
      danTocId: d02Tk1State.selectedEthnic.value?.value,
      quocTichId: d02Tk1State.selectedNationality.value?.value,
      tuThang: d02State.fromDateTextCtrl.text,
      denThang: d02State.toDateTextCtrl.text,
      chucVu: d02State.positionTextCtrl.text.trim(),
      noiLamViec: d02State.workplaceTextCtrl.text.trim(),
      dongTheoHeSo: d02State.isSalaryCoefficient.value,
      tienLuong: CurrencyUtils.formatNumberCurrencyString(
        d02State.salaryCoefficientTextCtrl.text,
      ),
      phuCapChucVu: CurrencyUtils.formatNumberCurrency(
        d02State.positionAllowanceTextCtrl.text,
      ),
      phuCapThamNienVuotKhung: CurrencyUtils.formatNumberCurrency(
        d02State.pcTNVuotKhungTextCtrl.text,
      ),
      phuCapThamNienNghe: CurrencyUtils.formatNumberCurrency(
        d02State.pcTNNTextCtrl.text,
      ),
      phuCapLuong: CurrencyUtils.formatNumberCurrencyString(
        d02State.salaryAllowanceTextCtrl.text,
      ),
      phuCapBoSung: CurrencyUtils.formatNumberCurrencyString(
        d02State.otherAllowanceTextCtrl.text,
      ),
      ghiChu: d02State.noteTextCtrl.text.trim(),
      xuatD01: d02State.isGenerateD01Data.value,
    );
  }
}
