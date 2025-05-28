enum AppRoutes {
  pageBuilder,
  login,
  forgotLogin,
  procedureList,
  declarationPeriod,
  staffList,
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

  //Chọn nhân viên
  selectStaff;

  String get path {
    return '/vbhxh_$name';
  }
}
