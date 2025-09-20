class OtherInfoData {
  final String? id;
  final String? kyKeKhaiId;
  final String? dotXetDuyet;
  final String? soDienThoai;
  final String? soTaiKhoan;
  final String? moTai;
  final String? chiNhanh;
  final String? thuTruongDonVi;
  final String? lyDoNopCham;
  final bool? guiKemHoSoGiay;

  OtherInfoData({
    this.id,
    this.kyKeKhaiId,
    this.dotXetDuyet,
    this.soDienThoai,
    this.soTaiKhoan,
    this.moTai,
    this.chiNhanh,
    this.thuTruongDonVi,
    this.lyDoNopCham,
    this.guiKemHoSoGiay,
  });

  factory OtherInfoData.fromJson(Map<String, dynamic> json) {
    return OtherInfoData(
      id: json['id'],
      kyKeKhaiId: json['kyKeKhaiId'],
      dotXetDuyet: json['dotXetDuyet'],
      soDienThoai: json['soDienThoai'],
      soTaiKhoan: json['soTaiKhoan'],
      moTai: json['moTai'],
      chiNhanh: json['chiNhanh'],
      thuTruongDonVi: json['thuTruongDonVi'],
      lyDoNopCham: json['lyDoNopCham'],
      guiKemHoSoGiay: json['guiKemHoSoGiay'],
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
