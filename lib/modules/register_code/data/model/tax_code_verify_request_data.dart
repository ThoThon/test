class TaxCodeVerifyRequestData {
  final String? taxCode;
  final String? userId;
  final String? credentialID;

  TaxCodeVerifyRequestData({
    this.taxCode,
    this.userId,
    this.credentialID,
  });

  Map<String, dynamic> toJson() {
    return {
      'MaSoThue': taxCode,
      'UserId': userId,
      'CredentialID': credentialID,
    };
  }
}
