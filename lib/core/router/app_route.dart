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

  ///Lịch sử
  history,

  ///Chi tiết lịch sử
  historyDetail,

  routeNfcInformationUser,

  //Quét CCCD
  nfc,

  ///View thông tin CCCD
  nfcInformationUser;

  String get path {
    return '/vbhxh_$name';
  }
}
