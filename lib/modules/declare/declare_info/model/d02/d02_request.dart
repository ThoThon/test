class D02Request {
  final String id;
  final String kyKeKhaiId;
  final String hoTen;
  final String maSoBhxh;
  final int loaiHoSo;
  final String phuongAnId;
  final bool xuatTk01;
  final String cmnd;
  final DateTime ngaySinh;
  final int gioiTinh;
  final int danTocId;
  final String quocTichId;
  final String tuThang;
  final String denThang;
  final String chucVu;
  final String noiLamViec;
  final double tienLuong;
  final double phuCapChucVu;
  final double phuCapThamNienVuotKhung;
  final double phuCapThamNienNghe;
  final double phuCapLuong;
  final double phuCapBoSung;
  final String ghiChu;

  const D02Request({
    required this.id,
    required this.kyKeKhaiId,
    required this.hoTen,
    required this.maSoBhxh,
    required this.loaiHoSo,
    required this.phuongAnId,
    required this.xuatTk01,
    required this.cmnd,
    required this.ngaySinh,
    required this.gioiTinh,
    required this.danTocId,
    required this.quocTichId,
    required this.tuThang,
    required this.denThang,
    required this.chucVu,
    required this.noiLamViec,
    required this.tienLuong,
    required this.phuCapChucVu,
    required this.phuCapThamNienVuotKhung,
    required this.phuCapThamNienNghe,
    required this.phuCapLuong,
    required this.phuCapBoSung,
    required this.ghiChu,
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
      'ngaySinh': ngaySinh.toIso8601String(),
      'gioiTinh': gioiTinh,
      'danTocId': danTocId,
      'quocTichId': quocTichId,
      'tuThang': tuThang,
      'denThang': denThang,
      'chucVu': chucVu,
      'noiLamViec': noiLamViec,
      'tienLuong': tienLuong,
      'phuCapChucVu': phuCapChucVu,
      'phuCapThamNienVuotKhung': phuCapThamNienVuotKhung,
      'phuCapThamNienNghe': phuCapThamNienNghe,
      'phuCapLuong': phuCapLuong,
      'phuCapBoSung': phuCapBoSung,
      'ghiChu': ghiChu,
    };
  }
}
