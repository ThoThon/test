enum PreviewDocumentTypeEnum {
  /// 0
  d01,

  /// 1
  d02,

  /// 2
  tk1,

  /// 01D-HSB
  /// 3
  hsb;

  int get value {
    switch (this) {
      case PreviewDocumentTypeEnum.d01:
        return 0;
      case PreviewDocumentTypeEnum.d02:
        return 1;
      case PreviewDocumentTypeEnum.tk1:
        return 2;
      case PreviewDocumentTypeEnum.hsb:
        return 3;
    }
  }
}
