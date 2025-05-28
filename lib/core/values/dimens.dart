import 'package:get/get.dart';

// Tỉ lệ chiều cao so với màn hình thiết kế
double ratioHeight = Get.height / AppDimens.heightDesign;
// Tỉ lệ chiều ngang so với màn hình thiết kế
double ratioWidth = Get.width / AppDimens.widthDesign;

class AppDimens {
  static double fontSize10() => 10.divSF;
  static double fontSmallest() => 12.divSF;
  static double fontSmall() => 14.divSF;
  static double fontMedium() => 16.divSF;
  static double fontBig() => 18.divSF;
  static double fontBiggest() => 20.divSF;
  static double fontSize24() => 24.divSF;
  /// Giá trị px màn hình Mobile design trên figma
  static const int heightDesign = 812;
  static const int widthDesign = 375;

  /// Text size
  static const double sizeTextSmallest = 10;
  static const double sizeTextSmaller = 12;
  static const double sizeTextSmall = 14;
  static const double sizeTextSmallTb = 15;
  static const double sizeTextMediumTb = 16;
  static const double sizeTextMedium = 18;
  static const double sizeTextLarge = 20;
  static const double sizeTextSupperLarge = 24;
  static const double sizeImg = 163;
  static const double size45 = 45;

  static const double paddingZero = 0;
  static const double paddingSmallest = 4.0;
  static const double paddingVerySmall = 8.0;
  static const double paddingSmall = 12.0;
  static const double defaultPadding = 16.0;
  static const double paddingMedium = 20.0;

  static const double sizeIconSmall = 12;
  static const double sizeIconDefault = 16;
  static const double sizeIcon = 20;
  static const double sizeIconMedium = 24;
  static const double sizeIcon32 = 32;
  static const double sizeIconLarge = 36;
  static const double sizeIconLoadingAwait = 80;
  static const double sizeCardItem = 48;

  // radiusBorder
  static const double radius4 = 4;
  static const double radius8 = 8;
  static const double radius12 = 12;
  static const double radius14 = 14;
  static const double radius16 = 16;
  static const double radius22 = 22;
  static const double radius20 = 20;
  static const double radius30 = 30;

  static const double btnSmall = 20;
  static const double btnRecommend = 30;
  static const double btnDefault = 40;
  static const double btnMedium = 50;
  static const double btnLarge = 70;
  static const double btnDefaultFigma = 38;
  static const double btnLargeFigma = 42;
  static const double btnLoginFigmaHeight = 54;
  static const double btnFloatingButton = 48;
  static const double btnHeigh46 = 46;

  static const double padding1 = 1.0;
  static const double padding2 = 2.0;
  static const double padding3 = 3.0;
  static const double padding5 = 5.0;
  static const double padding6 = 6.0;
  static const double padding10 = 10.0;
  static const double padding15 = 15.0;
  static const double padding14 = 14.0;
  static const double padding22 = 22.0;
  static const double padding25 = 25.0;
  static const double padding30 = 30.0;
  static const double padding40 = 40.0;
  static const double padding50 = 50.0;
  static const double padding60 = 60.0;
  static const double padding80 = 80.0;
  static const double padding85 = 85.0;
  static const double padding90 = 90.0;
  static const double padding95 = 95.0;
  static const double padding75 = 75.0;
  static const double padding78 = 78.0;

  static const double sizeDialogNotiIcon = 40;
}

extension GetSizeScreen on num {
  /// Tỉ lệ fontSize của các textStyle
  double get divSF {
    return this / Get.textScaleFactor;
  }

  // Tăng chiều dài theo font size
  double get mulSF {
    return this * Get.textScaleFactor;
  }
}
