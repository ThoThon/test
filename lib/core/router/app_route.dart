enum AppRoutes {
  pageBuilder,
  login,
  forgotLogin,
  procedureList,
  declarationPeriod,
  depositInfo,
  declareInfo,
  familyMemberDetail,
  declarationFormDetail,
  declarationList,
  viewPdf,

  routeDioLog,
  splash,

  ///Trang chủ
  home,
  moduleIcare,

  ///Thông tin đơn vị
  infoUnit,

  ///Lịch sử
  history,

  ///Tra cứu C12
  lookupC12,

  ///Chi tiết lịch sử
  historyDetail,

  //Quét CCCD
  nfc,

  ///View thông tin CCCD
  nfcInformationUser;

  String get path {
    return '/vbhxh_$name';
  }
}
