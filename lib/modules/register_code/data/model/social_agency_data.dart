class SocialAgencyData {
  final String? maCoQuanBHXH;
  final String? tenCoQuanBHXH;
  final String? maTinh;
  final String? tenTinhThanhPho;

  const SocialAgencyData({
    required this.maCoQuanBHXH,
    required this.tenCoQuanBHXH,
    required this.maTinh,
    required this.tenTinhThanhPho,
  });

  factory SocialAgencyData.fromJson(Map<String, dynamic> json) {
    return SocialAgencyData(
      maCoQuanBHXH: json['maCoQuanBHXH'],
      tenCoQuanBHXH: json['tenCoQuanBHXH'],
      maTinh: json['maTinh'],
      tenTinhThanhPho: json['tenTinhThanhPho'],
    );
  }
}
