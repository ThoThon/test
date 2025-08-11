class DistrictData {
  final String? id;
  final String? provinceId;
  final String? name;

  const DistrictData({
    this.id,
    this.provinceId,
    this.name,
  });

  factory DistrictData.fromJson(Map<String, dynamic> json) {
    return DistrictData(
      id: json['maHuyen'],
      provinceId: json['maTinh'],
      name: json['tenHuyen'],
    );
  }
}
