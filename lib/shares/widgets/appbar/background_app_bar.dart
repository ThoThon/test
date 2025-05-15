import 'package:flutter/services.dart';
import 'package:v_bhxh/modules/src.dart';

class BackgroundAppBar {
  static PreferredSizeWidget buildAppBar(
    String title, {
    Color? textColor,
    Color? actionsIconColor,
    Color? backButtonColor,
    Color? backgroundColor,
    bool centerTitle = false,
    TextStyle? style,
    FontWeight fontWeight = FontWeight.w400,
    Function()? funcLeading,
    bool leading = true,
    List<Widget>? actions,
    bool isColorGradient = false,
    List<Color>? colorTransparent,
    PreferredSizeWidget? widget,
    Widget? titleWidget,
    Widget? leadingWidget,
    bool statusBarIconBrightness = false,
    bool isContinuous = true,
    double? iconSize,
  }) {
    return AppBar(
      bottom: widget,
      surfaceTintColor: AppColors.colorWhite,
      actionsIconTheme:
          IconThemeData(color: actionsIconColor ?? AppColors.basicBlack),
      systemOverlayStyle: SystemUiOverlayStyle(
          systemNavigationBarColor: AppColors.dsGray5,
          statusBarColor: AppColors.colorTransparent,
          statusBarBrightness:
              statusBarIconBrightness ? Brightness.dark : Brightness.light,
          statusBarIconBrightness:
              statusBarIconBrightness ? Brightness.light : Brightness.dark),
      title: titleWidget ??
          SDSBuildText(
            title,
            // availableStyle: availableStyle ?? StyleEnum.subBold,
            style: style ??
                AppTextStyle.font16Bo.copyWith(
                  color: textColor ?? AppColors.basicBlack,
                ),

            textAlign: TextAlign.center,
            maxLines: 2,
          ),
      automaticallyImplyLeading: false,
      centerTitle: centerTitle,
      leading: !leading
          ? leadingWidget
          : ButtonUtils.baseOnAction(
              onTap: () {
                if (funcLeading != null) {
                  funcLeading();
                } else {
                  Get.back();
                }
              },
              child: IconButton(
                onPressed: null,
                icon: Icon(
                  Icons.chevron_left,
                  color: backButtonColor ?? AppColors.basicBlack,
                  size: iconSize ?? AppDimens.sizeIconMedium,
                ),
              ),
              isContinuous: isContinuous,
            )
      /*BackButton(
              color: backButtonColor ?? AppColors.textColorDefault,
              onPressed: funcLeading,
            )*/
      ,
      // flexibleSpace: isColorGradient
      //     ? Container(
      //   decoration: BoxDecoration(
      //     gradient: LinearGradient(
      //       begin: Alignment.bottomLeft,
      //       end: Alignment.bottomRight,
      //       colors: colorTransparent ??
      //           <Color>[
      //             AppColors.colorBackgroundLight,
      //             AppColors.colorBackgroundLight,
      //           ],
      //     ),
      //   ),
      // )
      //     : null,
      actions: actions,
      backgroundColor: AppColors.colorTransparent,
      // isColorGradient ? null : backgroundColor ?? AppColors.colorWhite,
      titleSpacing: titleWidget == null ? null : 0,
    );
  }
}
