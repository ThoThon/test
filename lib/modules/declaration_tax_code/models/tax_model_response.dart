class TaxModelResponse {
  final String id;
  final String email;
  final String taxcode;
  final bool isActive;
  final DateTime createTime;

  TaxModelResponse({
    required this.id,
    required this.email,
    required this.taxcode,
    required this.isActive,
    required this.createTime,
  });

  factory TaxModelResponse.fromMap(Map<String, dynamic> json) =>
      TaxModelResponse(
        id: json["id"] ?? '',
        email: json["email"] ?? '',
        taxcode: json["taxcode"] ?? '',
        isActive: json["isActive"] ?? false,
        createTime: DateTime.parse(json["createTime"] ?? ''),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "email": email,
        "taxcode": taxcode,
        "isActive": isActive,
        "createTime": createTime.toIso8601String(),
      };
}
