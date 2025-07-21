enum WorkingConditionEnum {
  // Bình thường
  normal,
  // Làm việc NNĐH
  dangerous,
  // PCVK > 0.7
  highAllowance;

  String get title {
    switch (this) {
      case WorkingConditionEnum.normal:
        return 'Bình thường';
      case WorkingConditionEnum.dangerous:
        return 'Làm việc trong điều kiện NNĐH';
      case WorkingConditionEnum.highAllowance:
        return 'Nơi có phụ cấp VK > 0.7';
    }
  }
}
