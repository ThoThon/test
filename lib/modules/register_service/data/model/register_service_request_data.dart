class RegisterServiceRequestData {
  final String userId;
  final String credentialID;

  RegisterServiceRequestData({
    required this.userId,
    required this.credentialID,
  });

  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'credentialID': credentialID,
    };
  }
}
