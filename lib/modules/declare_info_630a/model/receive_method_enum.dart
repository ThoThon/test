enum ReceiveMethodEnum {
  // Không có số tài khoản
  noAccount,
  // ATM - Chi trả qua ATM
  atm,
  // BHXH - BHXH thực hiện chi trả
  bhxh,
  // DDCHI - Đại diện chi thực hiện chi trả
  ddChi;

  String get title {
    switch (this) {
      case ReceiveMethodEnum.noAccount:
        return 'Không có số tài khoản';
      case ReceiveMethodEnum.atm:
        return 'ATM - Chi trả qua ATM';
      case ReceiveMethodEnum.bhxh:
        return 'BHXH - BHXH thực hiện chi trả';
      case ReceiveMethodEnum.ddChi:
        return 'DDCHI - Đại diện chi thực hiện chi trả';
    }
  }
}
