import 'package:v_bhxh/shares/date/date_utils.dart';

import 'tk1_state_607.dart';

class Tk1Request607 {
  final String? id;
  final String? kyKeKhaiId;
  final String? hoTen;
  final String? maSoBhxh;
  final String? cmnd;
  final int chiCoNamSinh;
  final DateTime? ngaySinh;
  final int gioiTinh;
  final int? danTocId;
  final String? quocTichId;
  final String? khaiSinhTinhId;
  final String? khaiSinhHuyenId;
  final String? khaiSinhXaId;
  final bool trungDiaChiKhaiSinh;
  final String? noiNhanTinhId;
  final String? noiNhanHuyenId;
  final String? noiNhanXaId;
  final String? noiNhanDiaChiChiTiet;
  final String? benhVienTinhId;
  final String? benhVienId;
  final String? dienThoaiLienHe;
  final String? noiDungThayDoi;
  final String? hoSoKemTheo;
  final String? dangKyNhanKetQua;
  final bool laChuHo;
  final String? hoTenChuHo;
  final String? chuHoSoCccd;
  final String? chuHoThuongTruTinhId;
  final String? chuHoThuongTruHuyenId;
  final String? chuHoThuongTruXaId;
  final String? diaChiThuongTruChuHo;
  final String? diaChiKhaiSinh;

  Tk1Request607({
    this.id,
    this.kyKeKhaiId,
    this.hoTen,
    this.maSoBhxh,
    this.cmnd,
    required this.chiCoNamSinh,
    this.ngaySinh,
    required this.gioiTinh,
    this.danTocId,
    this.quocTichId,
    this.khaiSinhTinhId,
    this.khaiSinhHuyenId,
    this.khaiSinhXaId,
    required this.trungDiaChiKhaiSinh,
    this.noiNhanTinhId,
    this.noiNhanHuyenId,
    this.noiNhanXaId,
    this.noiNhanDiaChiChiTiet,
    this.benhVienTinhId,
    this.benhVienId,
    this.dienThoaiLienHe,
    this.noiDungThayDoi,
    this.hoSoKemTheo,
    this.dangKyNhanKetQua,
    required this.laChuHo,
    this.hoTenChuHo,
    this.chuHoSoCccd,
    this.chuHoThuongTruTinhId,
    this.chuHoThuongTruHuyenId,
    this.chuHoThuongTruXaId,
    this.diaChiThuongTruChuHo,
    this.diaChiKhaiSinh,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'kyKeKhaiId': kyKeKhaiId,
      'hoTen': hoTen,
      'maSoBhxh': maSoBhxh,
      'cmnd': cmnd,
      'chiCoNamSinh': chiCoNamSinh,
      'ngaySinh': ngaySinh?.toIso8601String(),
      'gioiTinh': gioiTinh,
      'danTocId': danTocId,
      'quocTichId': quocTichId,
      'khaiSinhTinhId': khaiSinhTinhId,
      'khaiSinhHuyenId': khaiSinhHuyenId,
      'khaiSinhXaId': khaiSinhXaId,
      'trungDiaChiKhaiSinh': trungDiaChiKhaiSinh,
      'noiNhanTinhId': noiNhanTinhId,
      'noiNhanHuyenId': noiNhanHuyenId,
      'noiNhanXaId': noiNhanXaId,
      'noiNhanDiaChiChiTiet': noiNhanDiaChiChiTiet,
      'benhVienTinhId': benhVienTinhId,
      'benhVienId': benhVienId,
      'dienThoaiLienHe': dienThoaiLienHe,
      'noiDungThayDoi': noiDungThayDoi,
      'hoSoKemTheo': hoSoKemTheo,
      'dangKyNhanKetQua': dangKyNhanKetQua,
      'laChuHo': laChuHo,
      'hoTenChuHo': hoTenChuHo,
      'chuHoSoCccd': chuHoSoCccd,
      'chuHoThuongTruTinhId': chuHoThuongTruTinhId,
      'chuHoThuongTruHuyenId': chuHoThuongTruHuyenId,
      'chuHoThuongTruXaId': chuHoThuongTruXaId,
      'diaChiThuongTruChuHo': diaChiThuongTruChuHo,
      'diaChiKhaiSinh': diaChiKhaiSinh,
    };
  }

  static Tk1Request607 fromState({
    required String kyKeKhaiId,
    required Tk1State607 tk1State,
  }) {
    return Tk1Request607(
      id: tk1State.id,
      kyKeKhaiId: kyKeKhaiId,
      hoTen: tk1State.fullNameTextCtrl.text.trim(),
      maSoBhxh: tk1State.bhxhTextCtrl.text.trim(),
      cmnd: tk1State.cccdTextCtrl.text.trim(),
      chiCoNamSinh: tk1State.birthType.value.rawValue,
      ngaySinh: convertStringToDateSafe(
        tk1State.dateOfBirthTextCtrl.text,
        tk1State.birthType.value.pattern,
      ),
      gioiTinh: tk1State.gender.value.rawValue,
      danTocId: tk1State.selectedEthnic.value?.value,
      quocTichId: tk1State.selectedNationality.value?.value,
      khaiSinhTinhId: tk1State.provinceOfBirth.value?.id,
      khaiSinhHuyenId: tk1State.districtOfBirth.value?.id,
      khaiSinhXaId: tk1State.wardOfBirth.value?.id,
      trungDiaChiKhaiSinh: tk1State.isDuplicateBirthAddress.value,
      noiNhanTinhId: tk1State.provinceReceive.value?.id,
      noiNhanHuyenId: tk1State.districtReceive.value?.id,
      noiNhanXaId: tk1State.wardReceive.value?.id,
      noiNhanDiaChiChiTiet: tk1State.addressReceiveTextCtrl.text.trim(),
      benhVienTinhId: tk1State.provinceKCB.value?.id,
      benhVienId: tk1State.hospitalKCB.value?.code,
      dienThoaiLienHe: tk1State.contactPhoneNumberTextCtrl.text.trim(),
      noiDungThayDoi: tk1State.contentChangesTextCtrl.text.trim(),
      hoSoKemTheo: tk1State.attachedProfileTextCtrl.text.trim(),
      dangKyNhanKetQua: tk1State.receiveResult.value.title,
      laChuHo: tk1State.isParticipantHeadOfHousehold.value,
      hoTenChuHo: tk1State.headOfHouseholdTextCtrl.text.trim(),
      chuHoSoCccd: tk1State.headOfHouseholdCCCDTextCtrl.text.trim(),
      chuHoThuongTruTinhId: tk1State.provinceTT.value?.id,
      chuHoThuongTruHuyenId: tk1State.districtTT.value?.id,
      chuHoThuongTruXaId: tk1State.wardTT.value?.id,
      diaChiThuongTruChuHo: tk1State.addressTTTextCtrl.text.trim(),
      diaChiKhaiSinh: tk1State.birthAddressTextCtrl.text.trim(),
    );
  }
}
