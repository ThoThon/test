class FamilyMemberRequest {
  final String id;
  final String kyKeKhaiId;
  final String hoTen;
  final String maSoBhxh;
  final DateTime ngaySinh;
  final int gioiTinh;
  final String danToc;
  final String quocTich;
  final String khaiSinhTinhId;
  final String khaiSinhHuyenId;
  final String khaiSinhXaId;
  final String moiQuanHe;
  final bool laNguoiThamGia;
  final bool isUpdate;

  FamilyMemberRequest({
    required this.id,
    required this.kyKeKhaiId,
    required this.hoTen,
    required this.maSoBhxh,
    required this.ngaySinh,
    required this.gioiTinh,
    required this.danToc,
    required this.quocTich,
    required this.khaiSinhTinhId,
    required this.khaiSinhHuyenId,
    required this.khaiSinhXaId,
    required this.moiQuanHe,
    required this.laNguoiThamGia,
    required this.isUpdate,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'kyKeKhaiId': kyKeKhaiId,
      'hoTen': hoTen,
      'maSoBhxh': maSoBhxh,
      'ngaySinh': ngaySinh.toIso8601String(),
      'gioiTinh': gioiTinh,
      'danToc': danToc,
      'quocTich': quocTich,
      'khaiSinhTinhId': khaiSinhTinhId,
      'khaiSinhHuyenId': khaiSinhHuyenId,
      'khaiSinhXaId': khaiSinhXaId,
      'moiQuanHe': moiQuanHe,
      'laNguoiThamGia': laNguoiThamGia,
      'isUpdate': isUpdate,
    };
  }
}
