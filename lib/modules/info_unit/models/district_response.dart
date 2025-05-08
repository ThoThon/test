class DistrictResponse {
  DistrictResponse({
    required this.provinceCode,
    required this.districtCode,
    required this.districtName,
  });

  final String provinceCode;
  final String districtCode;
  final String districtName;

  factory DistrictResponse.fromJson(Map<String, dynamic> json) {
    return DistrictResponse(
      provinceCode: json["maTinh"] ?? "",
      districtCode: json["maHuyen"] ?? "",
      districtName: json["tenHuyen"] ?? "",
    );
  }
}
