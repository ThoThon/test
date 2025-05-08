import '../../modules/src.dart';

/// class chứa các collection
class AppCollection {
  static Map<String, Color> mapColorBackgroundSnackBar = {
    AppConst.actionSuccess: AppColors.backgroundSuccess,
    AppConst.actionFail: AppColors.backgroundFail,
    AppConst.actionWarning: AppColors.backgroundWarning,
    AppConst.actionNotification: AppColors.colorWhite,
  };
  static Map<String, Color> mapColorBorderSnackBar = {
    AppConst.actionSuccess: AppColors.statusGreen,
    AppConst.actionFail: AppColors.statusRed,
    AppConst.actionWarning: AppColors.statusYellow,
    AppConst.actionNotification: AppColors.colorWhite,
  };
  static Map<String, String> mapIconSnackBar = {
    AppConst.actionSuccess: Assets.ASSETS_ICONS_ICON_SNACK_BAR_SUCCESS_SVG,
    AppConst.actionFail: Assets.ASSETS_ICONS_ICON_SNACK_BAR_FAIL_SVG,
    AppConst.actionWarning: Assets.ASSETS_ICONS_ICON_SNACK_BAR_WARNING_SVG,
    AppConst.actionNotification:
        Assets.ASSETS_ICONS_ICON_SNACK_BAR_NOTIFICATION_SVG,
  };
}
