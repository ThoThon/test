enum HistoryTransactionEnum {
  //Đăng ký
  registerTab,
  //Hồ sơ kê khai
  declarationFormTab;

  bool get isRegisterTab => this == HistoryTransactionEnum.registerTab;
  bool get isDeclarationForm =>
      this == HistoryTransactionEnum.declarationFormTab;
}
