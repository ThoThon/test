enum PeriodsScrollStrategy {
  /// Không tự động scroll, giữ nguyên vị trí hiện tại.
  none,

  /// Scroll về đầu danh sách - Sau khi lọc đợt kê khai.
  toTop,

  /// Scroll về cuối danh sách - Sau khi tạo mới đợt kê khai thành công.
  toLast,
}
