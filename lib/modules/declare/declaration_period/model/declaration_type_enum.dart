enum DeclarationTypeEnum {
  /// Tăng lao động
  increaseLabor,

  /// Giảm lao động
  decreaseLabor,

  /// Tăng lương
  increaseSalary,

  /// Giảm lương
  decreaseSalary;

  String get title {
    switch (this) {
      case increaseLabor:
        return 'Tăng lao động';
      case decreaseLabor:
        return 'Giảm lao động';
      case increaseSalary:
        return 'Tăng lương';
      case decreaseSalary:
        return 'Giảm lương';
    }
  }
}
