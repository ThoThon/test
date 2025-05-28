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

extension GenderExt on String {
  Gender get parseGender {
    final genderNfc = trim().toLowerCase();
    if (genderNfc == 'nam') return Gender.male;
    if (genderNfc == 'nữ' || genderNfc == 'nu') return Gender.female;
    return Gender.male;
  }
}
