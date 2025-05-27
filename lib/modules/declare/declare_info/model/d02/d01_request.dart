class D01Request {
  final String id;
  final String lienKetId;
  final String kyKeKhaiId;
  final String hoTen;
  final String maSoBhxh;
  final String tenLoaiVanBan;
  final String soVanBan;
  final DateTime ngayBanHanh;
  final String coQuanBanHanh;
  final String trichYeu;
  final String noiDungThamDinh;
  final DateTime ngayHieuLuc;
  final bool isUpdate;

  D01Request({
    required this.id,
    required this.lienKetId,
    required this.kyKeKhaiId,
    required this.hoTen,
    required this.maSoBhxh,
    required this.tenLoaiVanBan,
    required this.soVanBan,
    required this.ngayBanHanh,
    required this.coQuanBanHanh,
    required this.trichYeu,
    required this.noiDungThamDinh,
    required this.ngayHieuLuc,
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
      'ngayBanHanh': ngayBanHanh.toIso8601String(),
      'coQuanBanHanh': coQuanBanHanh,
      'trichYeu': trichYeu,
      'noiDungThamDinh': noiDungThamDinh,
      'ngayHieuLuc': ngayHieuLuc.toIso8601String(),
      'isUpdate': isUpdate,
    };
  }
}
