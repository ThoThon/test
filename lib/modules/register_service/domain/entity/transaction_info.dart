class TransactionInfo {
  // idCongTy
  final String companyId;

  // tenCongTy
  final String companyName;

  // maSoThue
  final String taxCode;

  // maDonVi
  final String unitCode;

  // maCQQL
  final String managementAgencyCode;

  // tenCQQL
  final String managementAgencyName;

  // tenChuTheCTS
  final String certificateOwner;

  // tenToChucCKS
  final String certificateOrgName;

  // thoiHanTuNgay
  final String validFrom;

  // thoiHanDenNgay
  final String validTo;

  // email
  final String email;

  // dienThoai
  final String phoneNumber;

  // soSerialCTS
  final String certificateSerial;

  // userId
  final String userId;

  TransactionInfo({
    required this.companyId,
    required this.companyName,
    required this.taxCode,
    required this.unitCode,
    required this.managementAgencyCode,
    required this.managementAgencyName,
    required this.certificateOwner,
    required this.certificateOrgName,
    required this.validFrom,
    required this.validTo,
    required this.email,
    required this.phoneNumber,
    required this.certificateSerial,
    required this.userId,
  });
}
