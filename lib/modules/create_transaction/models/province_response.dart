class ProvinceResponse {
  ProvinceResponse({
    required this.provinceCode,
    required this.provinceName,
    required this.administrativeCode,
  });

  final String provinceCode;
  final String provinceName;
  final String administrativeCode;

  factory ProvinceResponse.fromJson(Map<String, dynamic> json) {
    return ProvinceResponse(
      provinceCode: json["maTinh"] ?? "",
      provinceName: json["tenTinh"] ?? "",
      administrativeCode: json["maHanhChinh"] ?? "",
    );
  }
}
