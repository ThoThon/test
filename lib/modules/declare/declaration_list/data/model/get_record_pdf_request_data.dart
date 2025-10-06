class GetRecordPdfRequestData {
  final String? id;
  final String? staffId;

  GetRecordPdfRequestData({
    this.id,
    this.staffId,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'staffId': staffId,
    };
  }
}
