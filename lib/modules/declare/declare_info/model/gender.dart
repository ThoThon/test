enum Gender {
  /// 0: Nữ
  female,

  /// 1: Nam
  male;

  int get rawValue {
    switch (this) {
      case Gender.female:
        return 0;
      case Gender.male:
        return 1;
    }
  }
}
