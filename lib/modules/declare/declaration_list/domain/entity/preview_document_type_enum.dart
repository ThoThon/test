
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
}
