import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:month_picker_dialog/month_picker_dialog.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:v_bhxh/shares/widgets/keyboard/keyboard.dart';

import '../../../modules/src.dart';

class UtilWidget {
  static Widget buildLoading({
    Color? colorIcon,
  }) {
    return CupertinoActivityIndicator(
      color: colorIcon ?? AppColors.primaryColor,
    );
  }

  static const Widget shrink = SizedBox.shrink();
  static const Widget sizedBox4 = SizedBox(height: 4);
  static const Widget sizedBox5 = SizedBox(height: 5);
  static const Widget sizedBox8 = SizedBox(height: 8);
  static const Widget sizedBox10 = SizedBox(height: 10);
  static const Widget sizedBox12 = SizedBox(height: 12);
  static const Widget sizedBox16 = SizedBox(height: 16);
  static const Widget sizedBox20 = SizedBox(height: 20);
  static const Widget sizedBox24 = SizedBox(height: 24);
  static const Widget sizedBoxWidth20 = SizedBox(width: 20);
  static const Widget sizedBoxWidth8 = SizedBox(width: 8);
  static const Widget sizedBoxWidth10 = SizedBox(width: 10);
  static const Widget sizedBoxWidth16 = SizedBox(width: 16);

  /// Loading cho child
  static Widget baseShowLoadingChild({
    required WidgetCallback child,
    required bool isShowLoading,
    Color? colorIcon,
  }) {
    return isShowLoading
        ? Center(child: buildLoading(colorIcon: colorIcon))
        : child();
  }

  /// URL launcher
  static Future<void> launchInBrowser(String url) async {
    Uri uri;
    if (url.contains('https')) {
      uri = Uri.parse(url);
    } else {
      if (url.contains('softDreams.com')) {
        uri = Uri(
          scheme: 'mailto',
          path: url,
        );
      } else {
        uri = Uri(
          scheme: 'tel',
          path: url,
        );
      }
    }
    if (await canLaunchUrl(uri)) {
      /*bool resultLaunch = */ await launchUrl(uri,
          mode: LaunchMode.externalApplication);
    }
    /* if(!resultLaunch){
        if(Get.isDialogOpen == true){
          Get.back();
        }
      }
    } else {
      if(Get.isDialogOpen == true){
        Get.back();
      }
    }*/
  }

  static Widget buildSmartRefresher({
    required RefreshController refreshController,
    required Widget child,
    ScrollController? scrollController,
    Function()? onRefresh,
    Function()? onLoadMore,
    bool enablePullDown = true,
    bool enablePullUp = false,
  }) {
    return SmartRefresher(
      enablePullDown: enablePullDown,
      enablePullUp: enablePullUp,
      scrollController: scrollController,
      header: const MaterialClassicHeader(
        color: AppColors.primaryColor,
      ),
      controller: refreshController,
      onRefresh: onRefresh,
      onLoading: onLoadMore,
      footer: buildSmartRefresherCustomFooter(),
      child: child,
    );
  }

  static Widget buildSmartRefresherCustomFooter() {
    return CustomFooter(
      builder: (context, mode) {
        if (mode == LoadStatus.loading) {
          return const CupertinoActivityIndicator(
            color: AppColors.primaryColor,
          );
        } else {
          return const SizedBox();
        }
      },
    );
  }

  static Widget buildCardBase(
    Widget child, {
    Color? colorBorder,
    Color? backgroundColor,
    double? radius,
  }) =>
      Container(
        decoration: BoxDecoration(
          color: backgroundColor ?? Colors.white,
          borderRadius:
              BorderRadius.all(Radius.circular(radius ?? AppDimens.radius8)),
          border: Border.all(
            color: colorBorder ?? Colors.transparent,
          ),
        ),
        child: child,
      );

  static Widget buildExpansionCard({
    required String title,
    required List<Widget> children,
  }) {
    return Theme(
      data: ThemeData(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
      ),
      child: ExpansionTile(
        trailing: const Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Icon(Icons.arrow_drop_down),
          ],
        ),
        // Column(
        //   mainAxisSize: MainAxisSize.max,
        //   mainAxisAlignment: MainAxisAlignment.start,
        //   children: [Icon(Icons.arrow_drop_down)],
        // ),
        initiallyExpanded: true,
        collapsedBackgroundColor: AppColors.colorWhite,
        backgroundColor: AppColors.colorWhite,
        collapsedTextColor: AppColors.colorWhite,
        title: SDSBuildText(title),
        subtitle: const Column(
          children: [],
        ),
        shape: RoundedRectangleBorder(
          side: BorderSide.none,
          borderRadius: BorderRadius.circular(AppDimens.radius4),
        ),
        collapsedShape: RoundedRectangleBorder(
          side: BorderSide.none,
          borderRadius: BorderRadius.circular(AppDimens.radius4),
        ),
        children: children,
      ),
    ).paddingOnly(bottom: AppDimens.defaultPadding);
  }

  static Widget buildSolidButton({
    required String title,
    VoidCallback? onPressed,
    double? width,
    double? height,
  }) {
    return SizedBox(
      width: width,
      height: height ?? AppDimens.btnDefaultFigma,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppDimens.radius4),
          ),
        ),
        onPressed: onPressed,
        child: Center(
          child: SDSBuildText(
            title,
            style: AppTextStyle.font16Bo.copyWith(color: AppColors.colorWhite),
          ),
        ),
      ),
    );
  }

  static Widget buildSolidButtonBack({
    required String title,
    VoidCallback? onPressed,
    double? width,
    double? height,
  }) {
    return Container(
      width: width,
      height: height ?? AppDimens.btnDefaultFigma,
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: AppColors.primaryColor),
        borderRadius: BorderRadius.circular(AppDimens.radius4),
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.colorWhite,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppDimens.radius4),
          ),
        ),
        onPressed: onPressed,
        child: SDSBuildText(
          title,
          style: AppTextStyle.font16Bo.copyWith(color: AppColors.primaryColor),
        ),
      ),
    );
  }

  static Widget buildBottomSheetAddImage({
    required Widget child,
  }) {
    return Container(
      padding: EdgeInsets.only(
        left: AppDimens.defaultPadding,
        right: AppDimens.defaultPadding,
        bottom: GetPlatform.isAndroid ? AppDimens.paddingVerySmall : 0.0,
      ),
      decoration: const BoxDecoration(
        color: AppColors.colorWhite,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(AppDimens.radius30),
          topRight: Radius.circular(AppDimens.radius30),
        ),
      ),
      child: Container(
        constraints: BoxConstraints(maxHeight: Get.height * 0.8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Center(
              child: Container(
                height: AppDimens.paddingSmallest,
                width: AppDimens.sizeIconLarge,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(
                      Radius.circular(AppDimens.defaultPadding)),
                  color: AppColors.dsGray4,
                ),
              ).paddingSymmetric(vertical: AppDimens.defaultPadding),
            ),
            child,
          ],
        ),
      ),
    );
  }

  static Widget buildDropdown<T>({
    required List<T> items,
    required String Function(T) display,
    T? selectedItem,
    ValueChanged<T?>? onChanged,
    double height = 50,
    String? hintText,
    double? radius,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.colorWhite,
        borderRadius:
            BorderRadius.all(Radius.circular(radius ?? AppDimens.radius8)),
        border: Border.all(color: AppColors.dsGray4),
      ),
      child: DropdownButtonHideUnderline(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppDimens.defaultPadding,
          ),
          child: DropdownButton<T>(
            dropdownColor: AppColors.colorWhite,
            isExpanded: true,
            selectedItemBuilder: (context) => items.map(
              (e) {
                return Align(
                  alignment: Alignment.centerLeft,
                  child: SDSBuildText(
                    display(e),
                    style: AppTextStyle.font14Re,
                    maxLines: 2,
                    textAlign: TextAlign.start,
                  ),
                );
              },
            ).toList(),
            items: items
                .map(
                  (e) => DropdownMenuItem<T>(
                    value: e,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: AppDimens.paddingVerySmall),
                      child: SDSBuildText(
                        display(e),
                        style: selectedItem == e
                            ? AppTextStyle.font14Bo
                            : AppTextStyle.font14Re,
                        maxLines: 2,
                        textAlign: TextAlign.start,
                      ),
                      //   TextUtils(
                      // text: display(e),
                      // availableStyle: selectedItem == e
                      //     ? StyleEnum.bodyBold
                      //     : StyleEnum.bodyRegular,
                      //   maxLine: 2,
                      //   textAlign: TextAlign.start,
                      // ),
                    ),
                  ),
                )
                .toList(),
            value: selectedItem,
            onChanged: onChanged,
            hint: hintText != null
                ? SDSBuildText(
                    hintText,
                    style: AppTextStyle.font14Re.copyWith(
                      color: AppColors.dsGray3,
                    ),
                    maxLines: 2,
                  )
                : null,
          ),
        ),
      ),
    );
  }

  static Widget buildDropDownWithLabel<T>({
    bool isRequired = true,
    required String label,
    required List<T> items,
    required String Function(T) display,
    T? selectedItem,
    ValueChanged<T?>? onChanged,
    String? hintText,
    String? Function(T?)? validator,
  }) {
    return FormField<T>(
      autovalidateMode: AutovalidateMode.always,
      validator: isRequired
          ? (value) {
              if (validator != null) {
                return validator(value);
              }
              if (value == null) {
                return "${label.tr} ${LocaleKeys.input_inputEmpty.tr.toLowerCase()}";
              }
              return null;
            }
          : null,
      initialValue: selectedItem,
      builder: (FormFieldState<T> state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: label.isNotEmpty
                  ? const EdgeInsets.only(bottom: AppDimens.paddingSmallest)
                  : EdgeInsets.zero,
              child: RichText(
                text: TextSpan(
                  text: label,
                  style: AppTextStyle.font16Bo,
                  children: [
                    if (isRequired)
                      TextSpan(
                        text: ' (*)',
                        style: AppTextStyle.font12Re.copyWith(
                          color: AppColors.statusRed,
                        ),
                      ),
                  ],
                ),
              ),
            ),
            buildDropdown(
              radius: AppDimens.radius4,
              items: items,
              display: display,
              hintText: hintText,
              selectedItem: selectedItem,
              onChanged: (value) {
                state.didChange(value);
                if (onChanged != null) {
                  onChanged(value);
                }
                state.validate();
              },
            ),
            if (state.hasError)
              Padding(
                padding: const EdgeInsets.only(
                  top: AppDimens.paddingSmallest,
                  left: AppDimens.paddingSmall,
                ),
                child: SDSBuildText(
                  state.errorText!,
                  style: AppTextStyle.font12Re
                      .copyWith(color: AppColors.statusRed),
                ),
              ),
          ],
        );
      },
    );
  }

  static Widget buildBottomSheetSelect<T>({
    required String label,
    required String hintText,
    required Function(ValueChanged<T> didChange) funcSelect,
    required Rx<T?> item,
    required String Function(T) display,
    String? Function(T?)? validator,
  }) {
    return Obx(
      () {
        return FormField(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: validator,
          initialValue: item.value,
          builder: (FormFieldState<T> state) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.only(bottom: AppDimens.paddingVerySmall),
                  child: RichText(
                    text: TextSpan(
                      text: label,
                      style: AppTextStyle.font16Bo,
                      children: [
                        TextSpan(
                          text: ' (*)',
                          style: AppTextStyle.font12Re.copyWith(
                            color: AppColors.statusRed,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    KeyBoard.hide();
                    funcSelect(state.didChange);
                  },
                  child: Container(
                    padding: const EdgeInsets.all(AppDimens.paddingSmall),
                    decoration: BoxDecoration(
                      color: AppColors.colorWhite,
                      border: Border.all(
                        color: state.errorText != null
                            ? AppColors.statusRed
                            : AppColors.dsGray5,
                      ),
                      borderRadius: BorderRadius.circular(AppDimens.radius4),
                    ),
                    child: Obx(
                      () => Row(
                        children: [
                          Expanded(
                            child: SDSBuildText(
                              item.value != null
                                  ? display(item.value as T)
                                  : hintText,
                              style: AppTextStyle.font14Re.copyWith(
                                color: item.value != null
                                    ? AppColors.colorBlack
                                    : AppColors.dsGray3,
                              ),
                            ),
                          ),
                          const Icon(
                            Icons.arrow_drop_down,
                            color: AppColors.dsGray3,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                if (state.hasError)
                  Padding(
                    padding: const EdgeInsets.only(
                      top: AppDimens.paddingSmallest,
                      left: AppDimens.paddingVerySmall,
                    ),
                    child: SDSBuildText(
                      state.errorText!,
                      style: AppTextStyle.font12Re.copyWith(
                        color: AppColors.statusRed,
                      ),
                    ),
                  ),
              ],
            ).paddingOnly(bottom: AppDimens.paddingSmall);
          },
        );
      },
    );
  }

  static Widget baseBottomSheet({
    required String title,
    required Widget body,
    Widget? iconTitle,
    bool isSecondDisplay = false,
    bool isMiniSize = false,
    double? paddingPage,
    double? miniSizeHeight,
    Function()? onPressed,
    Widget? actionArrowBack,
    double? padding,
    double? paddingBottom,
    bool noAppBar = false,
    Color? backgroundColor,
    TextAlign? textAlign,
    double? maxWidth,
    AlignmentGeometry? alignment,
    bool isHeightMin = false,
  }) {
    return SafeArea(
      bottom: false,
      minimum: EdgeInsets.only(
        top: Get.mediaQuery.padding.top + (isSecondDisplay ? 100 : 20),
      ),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: paddingPage ?? AppDimens.paddingVerySmall,
          ),
          decoration: BoxDecoration(
            color: backgroundColor ?? AppColors.colorWhite,
            borderRadius: const BorderRadius.vertical(
              top: Radius.circular(
                AppDimens.paddingMedium,
              ),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              Center(
                child: Container(
                  width: AppDimens.padding60,
                  height: AppDimens.paddingVerySmall,
                  margin: const EdgeInsets.all(AppDimens.paddingVerySmall),
                  decoration: const BoxDecoration(
                      color: AppColors.dsGray2,
                      borderRadius: BorderRadius.all(Radius.circular(8))),
                ),
              ),
              noAppBar
                  ? const SizedBox()
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: SDSBuildText(
                            title,
                            textAlign: textAlign ?? TextAlign.center,
                            maxLines: 1,
                            style: AppTextStyle.font16Bo.copyWith(
                              color: AppColors.colorBlack,
                            ),
                          ).paddingOnly(top: AppDimens.paddingSmallest),
                        ),
                        iconTitle ?? const SizedBox(),
                      ],
                    ),
              isMiniSize
                  ? Flexible(
                      child: SizedBox(
                        height: isHeightMin
                            ? null
                            : (miniSizeHeight ?? Get.height / 2),
                        child: body,
                      ),
                    )
                  : Expanded(
                      child: body,
                    ),
            ],
          ).paddingSymmetric(
            horizontal: padding ?? 0,
          ),
        ),
      ).paddingOnly(
        bottom: paddingBottom ?? 0,
      ),
    );
  }

  static Widget buildBottomSheetFigma({
    required Widget child,
    String? title,
    Color? textColor,
  }) {
    return Container(
      padding: EdgeInsets.only(
        left: AppDimens.defaultPadding,
        right: AppDimens.defaultPadding,
        bottom: GetPlatform.isAndroid ? AppDimens.paddingVerySmall : 0.0,
      ),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(AppDimens.radius30),
          topRight: Radius.circular(AppDimens.radius30),
        ),
      ),
      child: Container(
        constraints: BoxConstraints(maxHeight: Get.height * 0.8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            buildBottomHeader(),
            if (title != null)
              SDSBuildText(
                title,
                style: AppTextStyle.font20Bo.copyWith(
                  color: textColor ?? AppColors.primaryColor,
                ),
                textAlign: TextAlign.center,
              ).paddingOnly(
                top: AppDimens.paddingSmallest,
                bottom: AppDimens.paddingSmallest,
              ),
            child,
          ],
        ),
      ),
    );
  }

  static Widget buildBottomHeader() {
    return Center(
      child: Container(
        height: AppDimens.paddingSmallest,
        width: AppDimens.sizeIconLarge,
        decoration: const BoxDecoration(
          borderRadius:
              BorderRadius.all(Radius.circular(AppDimens.defaultPadding)),
          color: Color(0xFFC0C4C8),
        ),
      ).paddingSymmetric(vertical: AppDimens.defaultPadding),
    );
  }

  static Widget buildDividerDefault() {
    return const Divider(
      height: 10,
      thickness: 1,
    );
  }

  static Widget buildTextInput({
    var height,
    Color? textColor,
    String? hintText,
    Color? hintColor,
    Color? fillColor,
    TextEditingController? controller,
    Function(String)? onChanged,
    Function()? onTap,
    Widget? prefixIcon,
    Widget? suffixIcon,
    FocusNode? focusNode,
    Color? borderColor,
    bool? autofocus,
    BorderRadius? borderRadius,
  }) {
    return SizedBox(
      height: height,
      child: TextField(
        textAlignVertical: TextAlignVertical.center,
        focusNode: focusNode,
        autofocus: autofocus ?? true,
        style: TextStyle(
          color: textColor ?? Colors.black,
          fontSize: AppDimens.sizeTextMediumTb,
        ),
        decoration: InputDecoration(
            hoverColor: Colors.white,
            prefixIcon: prefixIcon,
            fillColor: fillColor,
            filled: true,
            suffixIcon: suffixIcon,
            hintText: hintText ?? "",
            hintStyle: TextStyle(
              color: hintColor ?? Colors.black,
              fontSize: AppDimens.sizeTextMediumTb,
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: borderColor ?? Colors.grey),
              borderRadius: borderRadius ??
                  const BorderRadius.all(
                    Radius.circular(5),
                  ),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: borderColor ?? Colors.grey),
              borderRadius: borderRadius ??
                  const BorderRadius.all(
                    Radius.circular(5),
                  ),
            ),
            contentPadding: const EdgeInsets.all(10)),
        onChanged: onChanged,
        onTap: onTap,
        controller: controller,
      ),
    );
  }

  static Widget buildGradient({
    required Widget child,
    required Gradient gradient,
  }) {
    return ShaderMask(
      blendMode: BlendMode.srcIn,
      shaderCallback: (bounds) => gradient.createShader(
        Rect.fromLTWH(0, 0, bounds.width, bounds.height),
      ),
      child: child,
    );
  }

  static Widget buildEmptyList() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SDSImageSvg(Assets.ASSETS_ICONS_ICON_LIST_NULL_SVG),
          sdsSBHeight8,
          SDSBuildText(
            LocaleKeys.dialog_empty.tr,
            style: AppTextStyle.font16Bo.copyWith(
              color: AppColors.dsGray5,
            ),
          ),
        ],
      ),
    );
  }

  static Future<DateTime?> showPeriodDatePicker({
    DateTime? dateTime,
  }) async {
    final context = Get.context;
    if (context == null) return null;

    return showMonthPicker(
      context: context,
      initialDate: dateTime ?? DateTime.now(),
      monthPickerDialogSettings: const MonthPickerDialogSettings(
        headerSettings: PickerHeaderSettings(
          headerBackgroundColor: AppColors.primaryColor,
        ),
        dialogSettings: PickerDialogSettings(
          locale: Locale('vi'),
          dialogRoundedCornersRadius: 4,
          dialogBackgroundColor: Colors.white,
        ),
        dateButtonsSettings: PickerDateButtonsSettings(
          buttonBorder: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(4),
            ),
          ),
          selectedMonthBackgroundColor: AppColors.primaryColor,
        ),
      ),
    );
  }

  static Future<int?> showYearLookUp({
    DateTime? dateTime,
  }) async {
    final context = Get.context;
    if (context == null) return null;
    return showYearPicker(
      context: context,
      initialDate: dateTime ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
      monthPickerDialogSettings: const MonthPickerDialogSettings(
        headerSettings: PickerHeaderSettings(
          headerBackgroundColor: AppColors.primaryColor,
        ),
        dialogSettings: PickerDialogSettings(
          locale: Locale('vi'),
          dialogRoundedCornersRadius: 4,
          dialogBackgroundColor: Colors.white,
        ),
        dateButtonsSettings: PickerDateButtonsSettings(
          buttonBorder: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(4),
            ),
          ),
          selectedMonthBackgroundColor: AppColors.primaryColor,
        ),
      ),
    );
  }

  static Widget buildCheckboxWithLabel({
    required String label,
    required bool value,
    ValueChanged<bool?>? onChanged,
  }) {
    return GestureDetector(
      onTap: () {
        if (onChanged != null) {
          onChanged(!value);
        }
      },
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Checkbox(
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            value: value,
            activeColor: AppColors.primaryColor,
            onChanged: onChanged,
          ),
          SDSBuildText(
            label,
            style: AppTextStyle.font16Semi,
          ),
        ],
      ),
    );
  }

  static Widget buildSelectDate(
    String title, {
    String? date,
    String? hintText,
    bool isRequired = true,
    VoidCallback? onTap,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        RichText(
          text: TextSpan(
            text: title,
            style: AppTextStyle.font16Bo,
            children: [
              if (isRequired)
                TextSpan(
                  text: ' (*)',
                  style: AppTextStyle.font12Re.copyWith(
                    color: AppColors.statusRed,
                  ),
                ),
            ],
          ),
        ).paddingOnly(bottom: AppDimens.paddingVerySmall),
        Material(
          color: AppColors.colorWhite,
          borderRadius: BorderRadius.circular(AppDimens.radius4),
          child: InkWell(
            onTap: onTap,
            borderRadius: BorderRadius.circular(AppDimens.radius4),
            child: Container(
              padding: const EdgeInsets.all(AppDimens.paddingVerySmall),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(AppDimens.radius4),
                border: Border.all(color: AppColors.dsGray4),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SDSBuildText(
                    date ?? hintText ?? '',
                    style: AppTextStyle.font16Re.copyWith(
                      color:
                          date != null ? AppColors.dsGray1 : AppColors.dsGray3,
                    ),
                  ),
                  SvgPicture.asset(
                    Assets.ASSETS_ICONS_IC_CALENDAR_SVG,
                    width: AppDimens.sizeIconMedium,
                    height: AppDimens.sizeIconMedium,
                  )
                ],
              ).paddingSymmetric(vertical: AppDimens.paddingSmallest),
            ),
          ),
        ),
      ],
    );
  }
}
