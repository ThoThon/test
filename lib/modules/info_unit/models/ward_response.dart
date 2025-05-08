class WardResponse {
  WardResponse({
    required this.provinceCode,
    required this.districtCode,
    required this.wardCode,
    required this.wardName,
  });

  final String provinceCode;
  final String districtCode;
  final String wardCode;
  final String wardName;

  factory WardResponse.fromJson(Map<String, dynamic> json) {
    return WardResponse(
      provinceCode: json["maTinh"] ?? "",
      districtCode: json["maHuyen"] ?? "",
      wardCode: json["maXa"] ?? "",
      wardName: json["tenXa"] ?? "",
    );
  }
}
