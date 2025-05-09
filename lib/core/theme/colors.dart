import 'package:flutter/material.dart';

class AppColors {
  static final AppColors _singleton = AppColors._internal();

  factory AppColors() {
    return _singleton;
  }

  AppColors._internal();

  static const Color primaryColor = Color(0xFFED1B2F);
  static const Color primaryNavy = Color(0xFF1C1E66);
  static const Color basicBlack = Color(0xFF333333);

  ///background, border snackBar
  static const Color backgroundSuccess = Color(0xFFECFBF1);
  static const Color backgroundFail = Color(0xFFFEEEEC);
  static const Color backgroundWarning = Color(0xFFFFF4D8);
  static const Color backgroundNotification = Color(0xFFE9F3FF);

  static const List<Color> primaryMain = [
    Color(0xFFFD5C00),
    Color(0xFFD40E19),
  ];

  static const List<Color> colorHeadPayroll = [
    Color(0xffF6921E),
    Color(0xffF15922),
  ];

  static const Color statusGreen = Color(0xFF379000);
  static const Color statusRed = Color(0xFFFE0000);
  static const Color statusYellow = Color(0xFFFFC700);
  static const Color statusNoti = Color(0xFF2A83EA);

  static const Color secondaryNavyPastel = Color(0xFFF1F3FF);
  static const Color secondaryCamPastel2 = Color(0xFFFFF3EC);
  static const Color secondaryCamPastel = Color(0xFFFFEADE);
  static const Color secondaryOrange3 = Color(0xFFCA4A00);
  static const Color secondaryOrange2 = Color(0xFFE45300);
  static const Color secondaryOrange1 = Color(0xFFFD5C00);

  static const Color colorTransparent = Colors.transparent;
  static const Color colorBlack = Colors.black;
  static const Color colorWhite = Colors.white;
  static Color colorGreyOpacity35 = Colors.black.withValues(alpha: 0.8);
  static const Color colorDisable = Color(0xFF9d9d9d);

  static const Color dsGray1 = Color(0xFF16243D);
  static const Color dsGray2 = Color(0xFF58647A);
  static const Color dsGray3 = Color(0xFF9BA3B1);
  static const Color dsGray4 = Color(0xFFD5D8DD);
  static const Color dsGray5 = Color(0xFFDBDBDB);
  static const Color greyDark = Color(0xFF16243D);
  static const Color greyLight = Color(0xFFDBDBDB);

  static const Color buttonTab = Color(0xFFFFF3EC);
  static const Color trackColorSwitch = Color(0xFFA9A9A9);
  static const Color thumbColorSwitch = Color(0xFF7E7E7E);

  static const Color backgroundColorLight = Color(0xFFF9F9F9);

  static const Color mainColors = Color.fromRGBO(242, 103, 36, 1);
}
