enum AppRoutes {
  pageBuilder,
  login,
  procedureList,
  declarationPeriod,
  declarationPeriodDetail,
  declareInfo,
  familyMemberDetail,
  checkListDetail,

  routeDioLog,
  splash,

  ///Trang chủ
  home,
  moduleIcare,

  ///Thông tin đơn vị
  infoUnit,

  ///Kê khai BHXH
  declarationTaxCode,
  declarationTaxCodeDetail,
  history,
  historyDetail,

  ///Danh sách chứng thư số
  listCertificate,

  //Màn hình xác nhận ký
  confirmCode,

  //Màn hình chờ
  awaitConfirmSignature,

  ///Xác thực chứng thư số
  verifyCertificate;

  String get path {
    return '/vbhxh_$name';
  }
}
