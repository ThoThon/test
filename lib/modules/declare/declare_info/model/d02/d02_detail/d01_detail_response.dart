class D01DetailResponse {
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

  const D01DetailResponse({
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

  factory D01DetailResponse.fromJson(Map<String, dynamic> json) {
    return D01DetailResponse(
      id: json['id'],
      lienKetId: json['lienKetId'],
      kyKeKhaiId: json['kyKeKhaiId'],
      hoTen: json['hoTen'],
      maSoBhxh: json['maSoBhxh'],
      tenLoaiVanBan: json['tenLoaiVanBan'],
      soVanBan: json['soVanBan'],
      ngayBanHanh: json['ngayBanHanh'] != null
          ? DateTime.parse(json['ngayBanHanh'])
          : null,
      coQuanBanHanh: json['coQuanBanHanh'],
      trichYeu: json['trichYeu'],
      noiDungThamDinh: json['noiDungThamDinh'],
      ngayHieuLuc: json['ngayHieuLuc'] != null
          ? DateTime.tryParse(json['ngayHieuLuc'])
          : null,
      isUpdate: json['isUpdate'] ?? false,
    );
  }
}
