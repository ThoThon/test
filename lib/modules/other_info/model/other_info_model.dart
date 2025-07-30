class OtherInfoModel {
  final String? id;
  final String kyKeKhaiId;
  final String dotXetDuyet;
  final String soDienThoai;
  final String soTaiKhoan;
  final String moTai;
  final String chiNhanh;
  final String thuTruongDonVi;
  final String lyDoNopCham;
  final bool guiKemHoSoGiay;

  OtherInfoModel({
    this.id,
    required this.kyKeKhaiId,
    required this.dotXetDuyet,
    required this.soDienThoai,
    required this.soTaiKhoan,
    required this.moTai,
    required this.chiNhanh,
    required this.thuTruongDonVi,
    required this.lyDoNopCham,
    required this.guiKemHoSoGiay,
  });

  factory OtherInfoModel.fromJson(Map<String, dynamic> json) {
    return OtherInfoModel(
      id: json['id'] ?? '',
      kyKeKhaiId: json['kyKeKhaiId'] ?? '',
      dotXetDuyet: json['dotXetDuyet'] ?? '',
      soDienThoai: json['soDienThoai'] ?? '',
      soTaiKhoan: json['soTaiKhoan'] ?? '',
      moTai: json['moTai'] ?? '',
      chiNhanh: json['chiNhanh'] ?? '',
      thuTruongDonVi: json['thuTruongDonVi'] ?? '',
      lyDoNopCham: json['lyDoNopCham'] ?? '',
      guiKemHoSoGiay: json['guiKemHoSoGiay'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'kyKeKhaiId': kyKeKhaiId,
      'dotXetDuyet': dotXetDuyet,
      'soDienThoai': soDienThoai,
      'soTaiKhoan': soTaiKhoan,
      'moTai': moTai,
      'chiNhanh': chiNhanh,
      'thuTruongDonVi': thuTruongDonVi,
      'lyDoNopCham': lyDoNopCham,
      'guiKemHoSoGiay': guiKemHoSoGiay,
    };
  }
}
