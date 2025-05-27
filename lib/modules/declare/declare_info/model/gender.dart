enum Gender {
  /// Nam
  male,

  /// Nữ
  female;
}

extension GenderExt on String {
  Gender get parseGender {
    final genderNfc = trim().toLowerCase();
    if (genderNfc == 'nam') return Gender.male;
    if (genderNfc == 'nữ' || genderNfc == 'nu') return Gender.female;
    return Gender.male;
  }
}
