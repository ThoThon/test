class Tk1Request {
  final String khaiSinhTinhId;
  final String khaiSinhHuyenId;
  final String khaiSinhXaId;
  final bool trungDiaChiKhaiSinh;
  final String noiNhanTinhId;
  final String noiNhanHuyenId;
  final String noiNhanXaId;
  final String noiNhanDiaChiChiTiet;
  final String benhVienTinhId;
  final String benhVienId;
  final String dienThoaiLienHe;
  final bool laChuHo;
  final String hoTenChuHo;
  final String chuHoSoCccd;
  final String chuHoThuongTruTinhId;
  final String chuHoThuongTruHuyenId;
  final String chuHoThuongTruXaId;
  final String diaChiThuongTruChuHo;

  Tk1Request({
    required this.khaiSinhTinhId,
    required this.khaiSinhHuyenId,
    required this.khaiSinhXaId,
    required this.trungDiaChiKhaiSinh,
    required this.noiNhanTinhId,
    required this.noiNhanHuyenId,
    required this.noiNhanXaId,
    required this.noiNhanDiaChiChiTiet,
    required this.benhVienTinhId,
    required this.benhVienId,
    required this.dienThoaiLienHe,
    required this.laChuHo,
    required this.hoTenChuHo,
    required this.chuHoSoCccd,
    required this.chuHoThuongTruTinhId,
    required this.chuHoThuongTruHuyenId,
    required this.chuHoThuongTruXaId,
    required this.diaChiThuongTruChuHo,
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
    };
  }
}
