class UpdateHistoryRigisterRequest {
  UpdateHistoryRigisterRequest({
    required this.id,
    required this.kqBuoc1,
    required this.kqBuoc2,
    required this.kqBuoc3,
    required this.soHoSo,
    required this.tiepNhan,
    required this.kqBuoc4,
    required this.maKqBuoc1,
    required this.maKqBuoc2,
    required this.maKqBuoc3,
  });

  final String id;
  final String kqBuoc1;
  final String kqBuoc2;
  final String kqBuoc3;
  final String soHoSo;
  final String tiepNhan;
  final String kqBuoc4;
  final String maKqBuoc1;
  final String maKqBuoc2;
  final String maKqBuoc3;

  factory UpdateHistoryRigisterRequest.fromJson(Map<String, dynamic> json) {
    return UpdateHistoryRigisterRequest(
      id: json["id"] ?? "",
      kqBuoc1: json["kqBuoc1"] ?? "",
      kqBuoc2: json["kqBuoc2"] ?? "",
      kqBuoc3: json["kqBuoc3"] ?? "",
      soHoSo: json["soHoSo"] ?? "",
      tiepNhan: json["tiepNhan"] ?? "",
      kqBuoc4: json["kqBuoc4"] ?? "",
      maKqBuoc1: json["maKqBuoc1"] ?? "",
      maKqBuoc2: json["maKqBuoc2"] ?? "",
      maKqBuoc3: json["maKqBuoc3"] ?? "",
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "kqBuoc1": kqBuoc1,
        "kqBuoc2": kqBuoc2,
        "kqBuoc3": kqBuoc3,
        "soHoSo": soHoSo,
        "tiepNhan": tiepNhan,
        "kqBuoc4": kqBuoc4,
        "maKqBuoc1": maKqBuoc1,
        "maKqBuoc2": maKqBuoc2,
        "maKqBuoc3": maKqBuoc3,
      };
}
