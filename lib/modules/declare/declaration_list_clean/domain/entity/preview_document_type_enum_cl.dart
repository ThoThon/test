
enum PreviewDocumentTypeEnumCl {
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

  int get value {
    switch (this) {
      case PreviewDocumentTypeEnumCl.d01:
        return 0;
      case PreviewDocumentTypeEnumCl.d02:
        return 1;
      case PreviewDocumentTypeEnumCl.tk1:
        return 2;
      case PreviewDocumentTypeEnumCl.sickHsb:
        return 3;
      case PreviewDocumentTypeEnumCl.maternityHsb:
        return 4;
      case PreviewDocumentTypeEnumCl.healingHsb:
        return 5;
    }
  }
}
