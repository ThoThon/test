enum DeclareMethodEnum {
  // Điều chỉnh
  adjustment,

  // Phát sinh
  incurred;

  String get title {
    switch (this) {
      case adjustment:
        return 'Điều chỉnh';
      case incurred:
        return "Phát sinh";
    }
  }
}
