class Tk01Id607Result {
  final String? hoTen;
  final String? documentRecordId;

  const Tk01Id607Result({
    this.hoTen,
    this.documentRecordId,
  });

  factory Tk01Id607Result.fromJson(Map<String, dynamic> json) {
    return Tk01Id607Result(
      hoTen: json['hoTen'],
      documentRecordId: json['documentRecordId'],
    );
  }
}
