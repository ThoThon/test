class SocialAgencyResponse {
  SocialAgencyResponse({
    required this.socialAgencyCode,
    required this.socialAgencyName,
    required this.administrativeCode,
    required this.provinceName,
  });

  final String socialAgencyCode;
  final String socialAgencyName;
  final String administrativeCode;
  final String provinceName;

  factory SocialAgencyResponse.fromJson(Map<String, dynamic> json) {
    return SocialAgencyResponse(
      socialAgencyCode: json["maCoQuanBHXH"] ?? "",
      socialAgencyName: json["tenCoQuanBHXH"] ?? "",
      administrativeCode: json["maHanhChinh"] ?? "",
      provinceName: json["tenTinhThanhPho"] ?? "",
    );
  }
}
