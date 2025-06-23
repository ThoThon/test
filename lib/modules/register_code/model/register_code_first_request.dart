class FirstRegisterRequest {
  final String coQuanBHXHQuanLy;
  final String coQuanBHXHTinh;
  final String credentialID;
  final String diaChi;
  final String diaChiHuyen;
  final String diaChiTinh;
  final String diaChiXa;
  final String diaChiDangKyKinhDoanh;
  final String dienThoai;
  final String dienThoaiLienHe;
  final String email;
  final String hoSoKemTheo;
  final String loaiDoiTuong;
  final String loaiHinhDonVi;
  final String maSoThue;
  final String nganhNgheSX;
  final String ngayDangKy;
  final String ngayLap;
  final String nguoiGiaoDich;
  final String noiCapQuyetDinh;
  final String noiDung;
  final String phuongThucDong;
  final String phuongThucNhanKetQua;
  final String soQuyetDinh;
  final String tenDonVi;
  final String userId;
  final String phuongThucNhan;
  final List<String>? imageFilePath;

  FirstRegisterRequest({
    required this.coQuanBHXHQuanLy,
    required this.coQuanBHXHTinh,
    required this.credentialID,
    required this.diaChi,
    required this.diaChiHuyen,
    required this.diaChiTinh,
    required this.diaChiXa,
    required this.diaChiDangKyKinhDoanh,
    required this.dienThoai,
    required this.dienThoaiLienHe,
    required this.email,
    required this.hoSoKemTheo,
    required this.loaiDoiTuong,
    required this.loaiHinhDonVi,
    required this.maSoThue,
    required this.nganhNgheSX,
    required this.ngayDangKy,
    required this.ngayLap,
    required this.nguoiGiaoDich,
    required this.noiCapQuyetDinh,
    required this.noiDung,
    required this.phuongThucDong,
    required this.phuongThucNhanKetQua,
    required this.soQuyetDinh,
    required this.tenDonVi,
    required this.userId,
    required this.phuongThucNhan,
    this.imageFilePath,
  });

  Map<String, dynamic> toJson() {
    return {
      'CoQuanBHXHQuanLy': coQuanBHXHQuanLy,
      'CoQuanBHXHTinh': coQuanBHXHTinh,
      'CredentialID': credentialID,
      'DiaChi': diaChi,
      'DiaChi_Huyen': diaChiHuyen,
      'DiaChi_Tinh': diaChiTinh,
      'DiaChi_Xa': diaChiXa,
      'DiaChiDangKyKinhDoanh': diaChiDangKyKinhDoanh,
      'DienThoai': dienThoai,
      'DienThoaiLienHe': dienThoaiLienHe,
      'Email': email,
      'HoSoKemTheo': hoSoKemTheo,
      'LoaiDoiTuong': loaiDoiTuong,
      'LoaiHinhDonVi': loaiHinhDonVi,
      'MaSoThue': maSoThue,
      'NganhNgheSX': nganhNgheSX,
      'NgayDangKy': ngayDangKy,
      'NgayLap': ngayLap,
      'NguoiGiaoDich': nguoiGiaoDich,
      'NoiCapQuyetDinh': noiCapQuyetDinh,
      'NoiDung': noiDung,
      'PhuongThucDong': phuongThucDong,
      'PhuongThucNhanKetQua': phuongThucNhanKetQua,
      'SoQuyetDinh': soQuyetDinh,
      'TenDonVi': tenDonVi,
      'UserId': userId,
      'PhuongThucNhan': phuongThucNhan,
      'TepDinhKemPath': imageFilePath, 
    };
  }
}
