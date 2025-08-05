class WardData {
  final String? id;
  final String? provinceId;
  final String? districtId;
  final String? name;

  const WardData({
    this.id,
    this.provinceId,
    this.districtId,
    this.name,
  });

  factory WardData.fromJson(Map<String, dynamic> json) {
    return WardData(
      id: json['maXa'],
      provinceId: json['maTinh'],
      districtId: json['maHuyen'],
      name: json['tenXa'],
    );
  }
}
