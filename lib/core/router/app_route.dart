enum AppRoutesIcare {
  routeDioLog,
  splash,

  ///Trang chủ
  home,
  moduleIcare,

  ///Kê khai BHXH
  declarationTaxCode,
  declarationTaxCodeDetail,
  createTransaction,
  historyTransaction,
  historyRegisterDetail,

  ///Danh sách chứng thư số
  listCertificate,

  //Màn hình xác nhận ký
  confirmCode,

  //Màn hình chờ
  awaitConfirmSignature,

  ///Xác thực chứng thư số
  verifyCertificate;

  String get path {
    return '/icare_$name';
  }
}
