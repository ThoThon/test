class FirstTimeRegisterRequestData {
  final String? coQuanBHXHQuanLy;
  final String? coQuanBHXHTinh;
  final String? credentialID;
  final String? diaChi;
  final String? diaChiHuyen;
  final String? diaChiTinh;
  final String? diaChiXa;
  final String? diaChiDangKyKinhDoanh;
  final String? dienThoai;
  final String? dienThoaiLienHe;
  final String? email;
  final String? hoSoKemTheo;
  final String? loaiDoiTuong;
  final String? loaiHinhDonVi;
  final String? maSoThue;
  final String? nganhNgheSX;
  final String? ngayDangKy;
  final String? ngayLap;
  final String? nguoiGiaoDich;
  final String? noiCapQuyetDinh;
  final String? noiDung;
  final String? phuongThucDong;
  final String? phuongThucNhanKetQua;
  final String? soQuyetDinh;
  final String? tenDonVi;
  final String? userId;
  final String? phuongThucNhan;
  final List<String>? imageFilePath;

  FirstTimeRegisterRequestData({
    this.coQuanBHXHQuanLy,
    this.coQuanBHXHTinh,
    this.credentialID,
    this.diaChi,
    this.diaChiHuyen,
    this.diaChiTinh,
    this.diaChiXa,
    this.diaChiDangKyKinhDoanh,
    this.dienThoai,
    this.dienThoaiLienHe,
    this.email,
    this.hoSoKemTheo,
    this.loaiDoiTuong,
    this.loaiHinhDonVi,
    this.maSoThue,
    this.nganhNgheSX,
    this.ngayDangKy,
    this.ngayLap,
    this.nguoiGiaoDich,
    this.noiCapQuyetDinh,
    this.noiDung,
    this.phuongThucDong,
    this.phuongThucNhanKetQua,
    this.soQuyetDinh,
    this.tenDonVi,
    this.userId,
    this.phuongThucNhan,
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
