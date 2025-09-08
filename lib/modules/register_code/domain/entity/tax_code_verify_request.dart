class TaxCodeVerifyRequest {
  final String taxCode;
  final String userId;
  final String credentialID;

  TaxCodeVerifyRequest({
    required this.taxCode,
    required this.userId,
    required this.credentialID,
  });
}
