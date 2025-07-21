enum AppRoutes {
  // pageBuilder,
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

  ///Chi tiết lịch sử hồ sơ kê khai
  historyDetailDeclare,

  ///Chi tiết lịch sử đăng ký giao dịch
  historyDetailRegister,

  //Chọn nhân viên
  selectStaff,

  //Thông tin cá nhân
  profile,

  //Thông báo
  notification,

  //Đăng ký dịch vụ
  registerService,

  //Đăng ký cấp mã
  registerCode,

  // Thay đổi đường dẫn
  changeBaseUrl,

  // Thủ tục 607
  declareInfo607,

  // Thủ tục 630a
  declareInfo630a;

  String get path {
    return '/vbhxh_$name';
  }
}
