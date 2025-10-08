class FileNumberData {
  final String? rHCode;
  final String? rHStatus;
  final String? rHTimeBHXH;
  final String? rHRecordNumber;

  FileNumberData({
    this.rHCode,
    this.rHStatus,
    this.rHTimeBHXH,
    this.rHRecordNumber,
  });

  factory FileNumberData.fromJson(Map<String, dynamic> json) {
    return FileNumberData(
      rHCode: json['rH_Code'],
      rHStatus: json['rH_Status'],
      rHTimeBHXH: json['rH_TimeBHXH'],
      rHRecordNumber: json['rH_RecordNumber'],
    );
  }
}
