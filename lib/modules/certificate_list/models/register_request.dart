class RegisterRequest {
  final String agencyCode;
  final String agencyName;
  final String businessRegistrationAddress;
  final String companyAddress;
  final String companyName;
  final String email;
  final String? expiredDate;
  final String idCompany;
  final String phone;
  final String? serial;
  final String? subjectInfo;
  final String taxCode;
  final String transactionPerson;
  final String? validDate;
  final String? certBase64;

  //Thuộc tính required khi đăng ký cấp mã
  final String? businessIndustry;
  final List<String>? imageFilePath;
  final String? receivingDistrict;
  final String? receivingMethod;
  final String? receivingProvince;
  final String? receivingWard;

  //Thuộc tính required khi đăng ký đã có mã
  final String? unitCode;

  RegisterRequest({
    required this.agencyCode,
    required this.agencyName,
    required this.businessRegistrationAddress,
    required this.companyAddress,
    required this.companyName,
    required this.email,
    this.expiredDate,
    required this.idCompany,
    required this.phone,
    this.serial,
    this.subjectInfo,
    required this.taxCode,
    required this.transactionPerson,
    this.validDate,
    this.certBase64,
    this.businessIndustry,
    this.imageFilePath,
    this.receivingDistrict,
    this.receivingMethod,
    this.receivingProvince,
    this.receivingWard,
    this.unitCode,
  });

  Map<String, dynamic> toJson() {
    return {
      'agencyCode': agencyCode,
      'agencyName': agencyName,
      // "attachedFile": imageFilePath,
      'businessIndustry': businessIndustry ?? '',
      'businessRegistrationAddress': businessRegistrationAddress,
      'companyAddress': companyAddress,
      'companyName': companyName,
      'email': email,
      'expiredDate': expiredDate ?? '',
      'idCompany': idCompany,
      'phone': phone,
      'certBase64': certBase64 ?? '',
      'receivingDistrict': receivingDistrict ?? '',
      'receivingMethod': receivingMethod ?? '',
      'receivingProvince': receivingProvince ?? '',
      'receivingWard': receivingWard ?? '',
      'serial': serial ?? '',
      'subjectInfo': subjectInfo ?? '',
      'taxcode': taxCode,
      'transactionPerson': transactionPerson,
      'validDate': validDate ?? '',
      'unitCode': unitCode ?? '',
    };
  }
}
