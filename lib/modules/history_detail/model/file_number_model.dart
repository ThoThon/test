class FileNumberModel {
  final String rHCode;
  final String rHStatus;
  final DateTime rHTimeBHXH;
  final String rHRecordNumber;

  FileNumberModel({
    required this.rHCode,
    required this.rHStatus,
    required this.rHTimeBHXH,
    required this.rHRecordNumber,
  });

  factory FileNumberModel.fromJson(Map<String, dynamic> json) {
    return FileNumberModel(
      rHCode: json['rH_Code'] ?? '',
      rHStatus: json['rH_Status'] ?? '',
      rHTimeBHXH:
          DateTime.tryParse(json['rH_TimeBHXH'] ?? '') ?? DateTime(2000),
      rHRecordNumber: json['rH_RecordNumber'] ?? '',
    );
  }
}
