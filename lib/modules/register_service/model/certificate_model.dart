class CertificateModel {
  final int stt;
  final String serialNumber;
  final String name;
  final String validFrom;
  final String validTo;
  final String cerdentialID;
  final String userId;

  CertificateModel({
    required this.stt,
    required this.serialNumber,
    required this.name,
    required this.validFrom,
    required this.validTo,
    required this.cerdentialID,
    required this.userId,
  });

  factory CertificateModel.fromJson(Map<String, dynamic> json) {
    return CertificateModel(
      stt: json['stt'] ?? 0,
      serialNumber: json['serialNumber'] ?? '',
      name: json['name'] ?? '',
      validFrom: json['validFrom'] ?? '',
      validTo: json['validTo'] ?? '',
      cerdentialID: json['cerdentialID'] ?? '',
      userId: json['userId'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'stt': stt,
      'serialNumber': serialNumber,
      'name': name,
      'validFrom': validFrom,
      'validTo': validTo,
      'cerdentialID': cerdentialID,
      'userId': userId,
    };
  }
}
