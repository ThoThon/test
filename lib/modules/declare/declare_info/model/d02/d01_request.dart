import 'package:v_bhxh/modules/declare/declare_info/model/d01_state.dart';

class D01Request {
  final String? id;
  final String? lienKetId;
  final String? kyKeKhaiId;
  final String? hoTen;
  final String? maSoBhxh;
  final String? tenLoaiVanBan;
  final String? soVanBan;
  final DateTime? ngayBanHanh;
  final String? coQuanBanHanh;
  final String? trichYeu;
  final String? noiDungThamDinh;
  final DateTime? ngayHieuLuc;
  final bool isUpdate;

  const D01Request({
    this.id,
    this.lienKetId,
    this.kyKeKhaiId,
    this.hoTen,
    this.maSoBhxh,
    this.tenLoaiVanBan,
    this.soVanBan,
    this.ngayBanHanh,
    this.coQuanBanHanh,
    this.trichYeu,
    this.noiDungThamDinh,
    this.ngayHieuLuc,
    required this.isUpdate,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'lienKetId': lienKetId,
      'kyKeKhaiId': kyKeKhaiId,
      'hoTen': hoTen,
      'maSoBhxh': maSoBhxh,
      'tenLoaiVanBan': tenLoaiVanBan,
      'soVanBan': soVanBan,
      'ngayBanHanh': ngayBanHanh?.toIso8601String(),
      'coQuanBanHanh': coQuanBanHanh,
      'trichYeu': trichYeu,
      'noiDungThamDinh': noiDungThamDinh,
      'ngayHieuLuc': ngayHieuLuc?.toIso8601String(),
      'isUpdate': isUpdate,
    };
  }

  static List<D01Request> fromState({
    required String kyKeKhaiId,
    required D01State d01State,
    required bool isUpdate,
  }) {
    return d01State.forms.map((form) {
      return D01Request(
        // Update thì lấy id từ form, nếu khi tạo mới thì id sẽ là null
        id: isUpdate ? form.id : null,
        kyKeKhaiId: kyKeKhaiId,
        hoTen: form.fullName,
        maSoBhxh: form.bhxhNumber,
        tenLoaiVanBan: form.documentType,
        soVanBan: form.documentNumber,
        ngayBanHanh: form.dateOfIssue,
        coQuanBanHanh: form.issuingAgency,
        trichYeu: form.summary,
        noiDungThamDinh: form.contentToBeAssessed,
        ngayHieuLuc: form.effectiveDate,
        isUpdate: isUpdate,
      );
    }).toList();
  }
}
