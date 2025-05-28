class StaffListRequest {
  final int pageIndex;
  final int pageSize;
  final String? hoTen;
  final String? maSoBHXH;

  StaffListRequest({
    required this.pageIndex,
    required this.pageSize,
    this.hoTen,
    this.maSoBHXH,
  });

  Map<String, dynamic> toJson() {
    return {
      'pageIndex': pageIndex,
      'pageSize': pageSize,
      'hoTen': hoTen ?? "",
      'maSoBHXH': maSoBHXH ?? "",
    };
  }
}
