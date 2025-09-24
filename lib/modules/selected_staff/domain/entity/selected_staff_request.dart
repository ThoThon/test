class SelectStaffRequest {
  final int pageIndex;
  final int pageSize;
  final String? hoTen;
  final String? maSoBHXH;

  SelectStaffRequest({
    required this.pageIndex,
    required this.pageSize,
    this.hoTen,
    this.maSoBHXH,
  });
}
