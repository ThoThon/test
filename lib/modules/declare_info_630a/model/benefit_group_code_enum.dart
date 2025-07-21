enum BenefitGroupCodeEnum {
  // Bản thân ốm
  selfSick,

  // Con ốm
  childSick,

  // Ốm dài ngày
  longTermSick;

  String get title {
    switch (this) {
      case selfSick:
        return 'O1 - Bản thân ốm';
      case childSick:
        return "O2 - Con ốm";
      case longTermSick:
        return "O3 - Ốm dài ngày";
    }
  }
}
