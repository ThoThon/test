import 'package:v_bhxh/modules/declare/declare_info/model/tk1_state.dart';

class Tk1Request {
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
  final bool laChuHo;
  final String? hoTenChuHo;
  final String? chuHoSoCccd;
  final String? chuHoThuongTruTinhId;
  final String? chuHoThuongTruHuyenId;
  final String? chuHoThuongTruXaId;
  final String? diaChiThuongTruChuHo;
  final String? diaChiKhaiSinh;

  const Tk1Request({
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

  static Tk1Request fromState({
    required Tk1State tk1State,
  }) {
    return Tk1Request(
      khaiSinhTinhId: tk1State.provinceOfBirth.value?.id,
      khaiSinhHuyenId: null, // Do bỏ huyện
      khaiSinhXaId: tk1State.wardOfBirth.value?.id,
      trungDiaChiKhaiSinh: tk1State.isDuplicateBirthAddress.value,
      noiNhanTinhId: tk1State.provinceReceive.value?.id,
      noiNhanHuyenId: null, // Do bỏ huyện
      noiNhanXaId: tk1State.wardReceive.value?.id,
      noiNhanDiaChiChiTiet: tk1State.addressReceiveTextCtrl.text.trim(),
      benhVienTinhId: tk1State.provinceKCB.value?.id,
      benhVienId: tk1State.hospitalKCB.value?.code,
      dienThoaiLienHe: tk1State.contactPhoneNumberTextCtrl.text.trim(),
      laChuHo: tk1State.isParticipantHeadOfHousehold.value,
      hoTenChuHo: tk1State.headOfHouseholdTextCtrl.text.trim(),
      chuHoSoCccd: tk1State.headOfHouseholdCCCDTextCtrl.text.trim(),
      chuHoThuongTruTinhId: tk1State.provinceTT.value?.id,
      chuHoThuongTruHuyenId: null, // Do bỏ huyện
      chuHoThuongTruXaId: tk1State.wardTT.value?.id,
      diaChiThuongTruChuHo: tk1State.addressTTTextCtrl.text.trim(),
      diaChiKhaiSinh: tk1State.birthAddressTextCtrl.text.trim(),
    );
  }
}
