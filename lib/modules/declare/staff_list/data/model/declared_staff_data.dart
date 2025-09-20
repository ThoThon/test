class DeclaredStaffData {
  final String? id;
  final int? index;
  final String? name;
  final String? bhxhNumber;

  const DeclaredStaffData({
    this.id,
    this.index,
    this.name,
    this.bhxhNumber,
  });

  factory DeclaredStaffData.fromJson(Map<String, dynamic> json) {
    return DeclaredStaffData(
      id: json['id'],
      index: json['stt'],
      name: json['hoTen'],
      bhxhNumber: json['maSoBHXH'],
    );
  }
}
