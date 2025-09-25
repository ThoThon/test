enum PreviewDocumentTypeEnum {
  /// 0
  d01,

  /// 1
  d02,

  /// 2
  tk1,

  /// 3
  /// Ốm đau
  sickHsb,

  /// 4
  /// Thai sản
  maternityHsb,

  /// 5
  /// Dưỡng sức
  healingHsb;

  int get rawValue {
    switch (this) {
      case PreviewDocumentTypeEnum.d01:
        return 0;
      case PreviewDocumentTypeEnum.d02:
        return 1;
      case PreviewDocumentTypeEnum.tk1:
        return 2;
      case PreviewDocumentTypeEnum.sickHsb:
        return 3;
      case PreviewDocumentTypeEnum.maternityHsb:
        return 4;
      case PreviewDocumentTypeEnum.healingHsb:
        return 5;
    }
  }

  static PreviewDocumentTypeEnum? parse(int? value) {
    if (value == null) return null;
    switch (value) {
      case 0:
        return PreviewDocumentTypeEnum.d01;
      case 1:
        return PreviewDocumentTypeEnum.d02;
      case 2:
        return PreviewDocumentTypeEnum.tk1;
      case 3:
        return PreviewDocumentTypeEnum.sickHsb;
      case 4:
        return PreviewDocumentTypeEnum.maternityHsb;
      case 5:
        return PreviewDocumentTypeEnum.healingHsb;
    }
    return null;
  }
}
