class CertificateData {
  final int? stt;
  final String? serialNumber;
  final String? name;
  final String? validFrom;
  final String? validTo;
  final String? cerdentialID;
  final String? userId;

  CertificateData({
    this.stt,
    this.serialNumber,
    this.name,
    this.validFrom,
    this.validTo,
    this.cerdentialID,
    this.userId,
  });

  factory CertificateData.fromJson(Map<String, dynamic> json) {
    return CertificateData(
      stt: json['stt'],
      serialNumber: json['serialNumber'],
      name: json['name'],
      validFrom: json['validFrom'],
      validTo: json['validTo'],
      cerdentialID: json['cerdentialID'],
      userId: json['userId'],
    );
  }
}
