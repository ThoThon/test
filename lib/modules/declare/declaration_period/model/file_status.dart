/// Trạng thái hồ sơ
enum FileStatus {
  /// 0: Chưa kê khai
  notYet,

  /// 1: Lưu nháp
  draft,

  /// 2: Đã lưu
  saved,

  /// 3: Đã gửi
  sent,

  /// 4: Đang chờ xử lý
  pending,

  /// 5: Thất bại
  failed,

  /// 6: Thành công
  success;

  static FileStatus fromInt(int? value) {
    switch (value) {
      case 0:
        return FileStatus.notYet;
      case 1:
        return FileStatus.draft;
      case 2:
        return FileStatus.saved;
      case 3:
        return FileStatus.sent;
      case 4:
        return FileStatus.pending;
      case 5:
        return FileStatus.failed;
      case 6:
        return FileStatus.success;
      default:
        return FileStatus.notYet;
    }
  }
}
