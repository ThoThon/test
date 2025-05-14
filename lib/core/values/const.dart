/// class chứa các giá trị không đổi quan trọng trong dự án
class AppConst {
  static const int requestTimeOut = 30000; //ms
  static const int requestTimeOutLong = 90000; //ms

  /// error const
  static const int error500 = 500;
  static const int error404 = 404;
  static const int error401 = 401;
  static const int error400 = 400;
  static const int error502 = 502;
  static const int error503 = 503;

  static const int currencyUtilsMaxLength = 12;

  static const String statusCodeSuccess = "00";

  static const int defaultPageSize = 10;

  static const int defaultPageNumber = 1;

  ///action snackbar
  static const String actionSuccess = "actionSuccess";
  static const String actionFail = "actionFail";
  static const String actionNotification = "actionNotification";
  static const String actionWarning = "actionWarning";

  ///name dialog
  static const String dialogConfirm = "dialogConfirm";

  static const int maxLines = 3;

  ///procedure code
  static const String procedure600 = '6001';
  static const String procedure600c = '6004';
  static const String procedure600d = '6005';
  static const String procedure600o = '6006';
}
