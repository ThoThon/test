import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_rounded_date_picker/flutter_rounded_date_picker.dart';
import 'package:flutter_svg/svg.dart';
import 'package:month_picker_dialog/month_picker_dialog.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:v_bhxh/shares/widgets/keyboard/keyboard.dart';

import '../../../modules/src.dart';
import 'dropdown_custom.dart' as dropdown_custom;

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
    Gradient? gradient,
  }) =>
      Container(
        decoration: BoxDecoration(
          gradient: gradient,
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
    double? borderRadius,
    TextStyle? textStyle,
    Color? backgroundColor,
    BorderSide? side,
  }) {
    return SizedBox(
      width: width,
      height: height ?? AppDimens.btnDefaultFigma,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor ?? AppColors.primaryColor,
          shape: RoundedRectangleBorder(
            side: side ?? BorderSide.none,
            borderRadius:
                BorderRadius.circular(borderRadius ?? AppDimens.radius4),
          ),
        ),
        onPressed: onPressed,
        child: Center(
          child: SDSBuildText(
            title,
            style: textStyle ??
                AppTextStyle.font16Bo.copyWith(color: AppColors.colorWhite),
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
    double? borderRadius,
    Color? borderColor,
    Color? backgroundColor,
    TextStyle? textStyle,
  }) {
    return SizedBox(
      width: width,
      height: height ?? AppDimens.btnDefaultFigma,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          backgroundColor: backgroundColor ?? AppColors.colorWhite,
          side: BorderSide(
            color: borderColor ?? AppColors.primaryColor,
            width: 1,
          ),
          shape: RoundedRectangleBorder(
            borderRadius:
                BorderRadius.circular(borderRadius ?? AppDimens.radius4),
          ),
        ),
        onPressed: onPressed,
        child: SDSBuildText(
          title,
          style: textStyle ??
              AppTextStyle.font16Bo.copyWith(color: AppColors.primaryColor),
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
    TextStyle? textStyle,
  }) {
    return FormField<T>(
      autovalidateMode: AutovalidateMode.onUserInteraction,
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
                  style: textStyle ?? AppTextStyle.font16Bo,
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

  /// buildDropDownWithLabel cũ không tự động validate lại thông tin khi gán lại giá trị của selectedItem
  /// nên chuyển sang dùng cái mặc định của Flutter
  static Widget buildDropDownWithLabel2<T>({
    bool isRequired = true,
    required String label,
    required List<T> items,
    required String Function(T) display,
    T? selectedItem,
    ValueChanged<T?>? onChanged,
    String? hintText,
    String? Function(T?)? validator,
    AutovalidateMode? autovalidateMode,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
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
        ButtonTheme(
          // REF: https://stackoverflow.com/a/78302373/15424249
          // Force dropdown menu có chiều rộng bằng với dropdown button
          alignedDropdown: true,
          child: dropdown_custom.DropdownButtonFormField<T>(
            isExpanded: true,
            autovalidateMode:
                autovalidateMode ?? AutovalidateMode.onUserInteraction,
            dropdownColor: AppColors.colorWhite,
            decoration: InputDecoration(
              errorStyle: AppTextStyle.font12Re.copyWith(
                color: AppColors.statusRed,
              ),
              fillColor: AppColors.colorWhite,
              filled: true,
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(AppDimens.radius4),
                borderSide: const BorderSide(color: AppColors.dsGray4),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(AppDimens.radius4),
                borderSide: const BorderSide(color: AppColors.dsGray4),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(AppDimens.radius4),
                borderSide: const BorderSide(color: AppColors.dsGray4),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(AppDimens.radius4),
                borderSide: const BorderSide(color: AppColors.statusRed),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(AppDimens.radius4),
                borderSide: const BorderSide(color: AppColors.statusRed),
              ),
              isDense: true,
            ),
            style: AppTextStyle.font14Re,
            selectedItemBuilder: (context) => items.map(
              (e) {
                return SDSBuildText(
                  display(e),
                  style: AppTextStyle.font14Re,
                );
              },
            ).toList(),
            items: items
                .map(
                  (e) => dropdown_custom.DropdownMenuItem<T>(
                    value: e,
                    child: SDSBuildText(
                      display(e),
                      style: selectedItem == e
                          ? AppTextStyle.font14Bo
                          : AppTextStyle.font14Re,
                      maxLines: 2,
                      textAlign: TextAlign.start,
                    ),
                  ),
                )
                .toList(),
            value: selectedItem,
            validator: (value) {
              if (!isRequired) return null;

              if (validator != null) {
                return validator(value);
              }

              if (value == null) {
                return "${label.tr} ${LocaleKeys.input_inputEmpty.tr.toLowerCase()}";
              }

              return null;
            },
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
      ],
    );
  }

  static Widget buildBottomSheetSelect<T>({
    required String label,
    required String hintText,
    bool isRequired = true,
    required Function(ValueChanged<T> didChange) funcSelect,
    required T? selectedItem,
    required String Function(T) display,
    String? Function(T?)? validator,
    VoidCallback? onTapClear,
    bool enableClearIcon = false,
    AutovalidateMode? autovalidateMode,
  }) {
    return FormField(
      autovalidateMode: autovalidateMode ?? AutovalidateMode.onUserInteraction,
      validator: isRequired ? validator : null,
      initialValue: selectedItem,
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
                child: Row(
                  children: [
                    Expanded(
                      child: SDSBuildText(
                        selectedItem != null ? display(selectedItem) : hintText,
                        style: AppTextStyle.font14Re.copyWith(
                          color: selectedItem != null
                              ? AppColors.colorBlack
                              : AppColors.dsGray3,
                        ),
                      ),
                    ),
                    selectedItem != null && enableClearIcon
                        ? GestureDetector(
                            onTap: onTapClear,
                            child: const Icon(Icons.close),
                          )
                        : const Icon(
                            Icons.arrow_drop_down,
                            color: AppColors.dsGray3,
                          ),
                  ],
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
  }

  static Widget buildCardBottomSheetSelect<T>({
    required String label,
    bool isRequired = true,
    required Function(ValueChanged<T> didChange) funcSelect,
    required T? selectedItem,
    required String Function(T) display,
    String? Function(T?)? validator,
    VoidCallback? onTapClear,
    bool enableClearIcon = false,
  }) {
    return FormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: isRequired ? validator : null,
      initialValue: selectedItem,
      builder: (FormFieldState<T> state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                KeyBoard.hide();
                funcSelect(state.didChange);
              },
              child: Container(
                padding: const EdgeInsets.all(AppDimens.paddingSmall),
                decoration: BoxDecoration(
                  color: AppColors.colorWhite,
                  borderRadius: BorderRadius.circular(AppDimens.radius4),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          RichText(
                            text: TextSpan(
                              text: label,
                              style: AppTextStyle.font14Re,
                              children: [
                                if (isRequired)
                                  TextSpan(
                                    text: ' *',
                                    style: AppTextStyle.font12Re.copyWith(
                                      color: AppColors.statusRed,
                                    ),
                                  ),
                              ],
                            ),
                          ),
                          sdsSBHeight4,
                          SDSBuildText(
                            selectedItem != null
                                ? display(selectedItem)
                                : "Chọn ${label.toLowerCase()}",
                            style: AppTextStyle.font14Re.copyWith(
                              color: selectedItem != null
                                  ? AppColors.colorBlack
                                  : AppColors.dsGray3,
                            ),
                          ),
                        ],
                      ),
                    ),
                    selectedItem != null && enableClearIcon
                        ? GestureDetector(
                            onTap: onTapClear,
                            child: const Icon(Icons.close),
                          )
                        : const Icon(
                            Icons.arrow_drop_down,
                            color: AppColors.dsGray3,
                          ),
                  ],
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
  }

  // TODO: Dùng thay thế cho buildCardBottomSheetSelect
  static Widget buildCardBottomSheetSelect2<T>({
    GlobalKey? fieldKey,
    required String label,
    bool isRequired = true,
    required Function(ValueChanged<T> didChange) funcSelect,
    required T? selectedItem,
    required String Function(T) display,
    String? Function(T?)? validator,
    VoidCallback? onTapClear,
    bool enableClearIcon = false,
    TextStyle? textStyleLabel,
    String? hintText,
    AutovalidateMode? autovalidateMode,
    bool enable = true,
  }) {
    return Stack(
      children: [
        FormField(
          key: fieldKey,
          autovalidateMode:
              autovalidateMode ?? AutovalidateMode.onUserInteraction,
          validator: isRequired ? validator : null,
          initialValue: selectedItem,
          builder: (FormFieldState<T> state) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {
                    KeyBoard.hide();
                    funcSelect(state.didChange);
                  },
                  child: Container(
                    padding: const EdgeInsets.only(
                      bottom: AppDimens.paddingVerySmall,
                      left: AppDimens.defaultPadding,
                      right: AppDimens.defaultPadding,
                      top: AppDimens.paddingVerySmall,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.colorWhite,
                      borderRadius: BorderRadius.circular(AppDimens.radius10),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  SDSBuildText(
                                    label,
                                    style: textStyleLabel ??
                                        AppTextStyle.font14Re.copyWith(
                                          color: AppColors.dsGray1,
                                        ),
                                  ),
                                  Visibility(
                                    visible: isRequired,
                                    child: SDSBuildText(
                                      ' *',
                                      style: AppTextStyle.font12Re.copyWith(
                                        color: AppColors.statusRed,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              sdsSBHeight8,
                              Row(
                                children: [
                                  Expanded(
                                    child: SDSBuildText(
                                      selectedItem != null
                                          ? display(selectedItem)
                                          : hintText ??
                                              LocaleKeys.app_select.tr,
                                      style: AppTextStyle.font14Re.copyWith(
                                        color: selectedItem != null
                                            ? AppColors.colorBlack
                                            : AppColors.textColorGrey,
                                      ),
                                    ),
                                  ),
                                  selectedItem != null && enableClearIcon
                                      ? GestureDetector(
                                          onTap: onTapClear,
                                          child: const Icon(Icons.close),
                                        )
                                      : SDSImageSvg(
                                          Assets.ASSETS_ICONS_IC_ARROW_DOWN_SVG,
                                          height: AppDimens.sizeIconMedium,
                                          width: AppDimens.sizeIconMedium,
                                        ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
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
                      maxLines: 2,
                      style: AppTextStyle.font12Re.copyWith(
                        color: AppColors.statusRed,
                      ),
                    ),
                  ),
              ],
            );
          },
        ),
        if (!enable)
          Positioned.fill(
            child: Container(
              padding: const EdgeInsets.all(AppDimens.paddingSmall),
              decoration: BoxDecoration(
                color: Colors.black12,
                borderRadius: BorderRadius.circular(AppDimens.radius10),
                border: Border.all(
                  color: AppColors.dsGray4,
                ),
              ),
            ),
          ),
      ],
    ).paddingOnly(bottom: AppDimens.paddingSmall);
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

  static Widget buildDividerStaffList() {
    return const Divider(
      color: AppColors.dsGray5,
    );
  }

  static Widget buildTextInput({
    double? height,
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
    int? maxLength,
    List<TextInputFormatter>? inputFormatters,
  }) {
    return SizedBox(
      height: height,
      child: TextField(
        inputFormatters: inputFormatters,
        textAlignVertical: TextAlignVertical.center,
        maxLength: maxLength,
        focusNode: focusNode,
        autofocus: autofocus ?? true,
        style: TextStyle(
          color: textColor ?? Colors.black,
          fontSize: AppDimens.sizeTextMediumTb,
        ),
        decoration: InputDecoration(
            counterText: '',
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

  static Widget buildEmptyOnRefresh({
    required RefreshController refreshController,
    Function()? onRefresh,
  }) {
    return UtilWidget.buildSmartRefresher(
      refreshController: refreshController,
      onRefresh: onRefresh,
      child: Center(
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
      ),
    );
  }

  static Future<DateTime?> showDateTimePicker({
    DateTime? dateTimeInit,
    DateTime? firstDate,
    DateTime? lastDate,
  }) async {
    final newDateTime = await showRoundedDatePicker(
      context: Get.context!,
      height: Get.height / 1.8,
      initialDate: dateTimeInit,
      firstDate: firstDate ?? DateTime(1900),
      lastDate: lastDate,
      textPositiveButton: 'Áp dụng',
      textNegativeButton: 'Hủy',
      // barrierDismissible: true,
      theme: ThemeData(
        primaryColor: AppColors.colorWhite,
        dialogBackgroundColor: AppColors.colorWhite,
        disabledColor: Colors.black54,
        textTheme: TextTheme(
          bodySmall: AppTextStyle.font14Semi.copyWith(color: Colors.black54),
          bodyMedium: AppTextStyle.font16Bo,
        ),
      ),
      styleDatePicker: MaterialRoundedDatePickerStyle(
        textStyleMonthYearHeader: AppTextStyle.font16Bo,
        colorArrowNext: Colors.black54,
        colorArrowPrevious: Colors.black54,
        textStyleButtonNegative:
            AppTextStyle.font16Bo.copyWith(color: Colors.black54),
        textStyleButtonPositive:
            AppTextStyle.font16Bo.copyWith(color: AppColors.primaryColor),
        decorationDateSelected: const BoxDecoration(
          color: AppColors.primaryColor,
          shape: BoxShape.circle,
        ),
        textStyleCurrentDayOnCalendar: AppTextStyle.font16Bo.copyWith(
          color: AppColors.primaryColor,
        ),
        textStyleYearButton: AppTextStyle.font16Bo,
        textStyleDayButton: AppTextStyle.font16Bo,
      ),
    );
    return newDateTime;
  }

  static Future<DateTime?> showPeriodDatePicker({
    DateTime? dateTime,
    DateTime? lastDate,
    bool onlyYear = false,
  }) async {
    final context = Get.context;
    if (context == null) return null;

    return showMonthPicker(
      context: context,
      onlyYear: onlyYear,
      lastDate: lastDate,
      initialDate: dateTime,
      monthPickerDialogSettings: MonthPickerDialogSettings(
        actionBarSettings: PickerActionBarSettings(
          cancelWidget: SDSBuildText(
            'Hủy',
            style: AppTextStyle.font14Bo.copyWith(color: AppColors.colorBlack),
          ),
          confirmWidget: SDSBuildText(
            'Áp dụng',
            style: AppTextStyle.font14Bo.copyWith(
              color: AppColors.primaryColor,
            ),
          ),
        ),
        headerSettings: const PickerHeaderSettings(
          headerBackgroundColor: AppColors.primaryColor,
        ),
        dialogSettings: const PickerDialogSettings(
          locale: Locale('vi'),
          dialogRoundedCornersRadius: 4,
          dialogBackgroundColor: Colors.white,
        ),
        dateButtonsSettings: PickerDateButtonsSettings(
          monthTextStyle: AppTextStyle.font12Re,
          buttonBorder: const RoundedRectangleBorder(
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
      monthPickerDialogSettings: MonthPickerDialogSettings(
        headerSettings: const PickerHeaderSettings(
          headerBackgroundColor: AppColors.primaryColor,
        ),
        dialogSettings: const PickerDialogSettings(
          locale: Locale('vi'),
          dialogRoundedCornersRadius: 4,
          dialogBackgroundColor: Colors.white,
        ),
        dateButtonsSettings: const PickerDateButtonsSettings(
          buttonBorder: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(4),
            ),
          ),
          selectedMonthBackgroundColor: AppColors.primaryColor,
        ),
        actionBarSettings: PickerActionBarSettings(
          cancelWidget: SDSBuildText(
            "Hủy",
            style: AppTextStyle.font14Bo.copyWith(color: AppColors.basicBlack),
          ),
          confirmWidget: SDSBuildText(
            "Áp dụng",
            style:
                AppTextStyle.font14Bo.copyWith(color: AppColors.primaryColor),
          ),
        ),
      ),
    );
  }

  static Widget buildCheckboxWithLabel({
    required String label,
    required bool value,
    ValueChanged<bool>? onChanged,
  }) {
    return GestureDetector(
      onTap: () {
        onChanged?.call(!value);
      },
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Checkbox(
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            value: value,
            activeColor: AppColors.primaryColor,
            onChanged: (value) {
              onChanged?.call(value ?? false);
            },
          ),
          SDSBuildText(
            label,
            style: AppTextStyle.font14Re,
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
    void Function(String)? onChanged,
    required int inputFormatters,
    required TextEditingController controller,
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
        BuildInputText(
          InputTextModel(
            controller: controller,
            suffixIcon: InkWell(
              onTap: onTap,
              child: SvgPicture.asset(
                Assets.ASSETS_ICONS_IC_CALENDAR_SVG,
                width: AppDimens.sizeIconMedium,
                height: AppDimens.sizeIconMedium,
                fit: BoxFit.scaleDown,
              ),
            ),
            inputFormatters: inputFormatters,
            textInputType: TextInputType.number,
            hintText: date ?? hintText ?? '',
            hintTextColor: date != null ? AppColors.dsGray1 : AppColors.dsGray3,
            hintTextSize: AppDimens.fontMedium(),
            onChanged: onChanged,
          ),
        ),
      ],
    );
  }

  /// Widget allows user to select a date with a text input field
  static Widget buildInputSelectDate({
    required String title,
    String? hintText,
    bool isRequired = true,
    VoidCallback? onSelectDate,
    void Function(String)? onChanged,
    required int inputFormatters,
    required TextEditingController controller,
    FormFieldValidator<String>? validator,
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
        BuildInputText(
          InputTextModel(
            controller: controller,
            suffixIcon: InkWell(
              onTap: onSelectDate,
              child: SvgPicture.asset(
                Assets.ASSETS_ICONS_IC_CALENDAR_SVG,
                width: AppDimens.sizeIconMedium,
                height: AppDimens.sizeIconMedium,
                fit: BoxFit.scaleDown,
              ),
            ),
            inputFormatters: inputFormatters,
            textInputType: TextInputType.number,
            hintText: hintText,
            onChanged: onChanged,
            validator: validator,
          ),
        ),
      ],
    );
  }

  static Widget buildSelectDateSafe(
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

  static Widget buildRadioWithTitle<T>({
    required String title,
    required T value,
    T? groupValue,
    required ValueChanged<T>? onChanged,
  }) {
    return InkWell(
      onTap: () {
        onChanged?.call(value);
      },
      child: Row(
        children: [
          Radio<T>(
            value: value,
            groupValue: groupValue,
            onChanged: (value) {
              if (value == null) return;
              onChanged?.call(value);
            },
            activeColor: AppColors.primaryColor,
          ),
          Expanded(
            child: SDSBuildText(
              title,
              style: AppTextStyle.font16Re,
            ),
          ),
        ],
      ),
    );
  }

  static Widget buildListRadio<T>({
    required T? selectedItem,
    required List<T> options,
    required String Function(T) getTitle,
    ValueChanged<T>? onChanged,
    AutovalidateMode? autovalidateMode,
    String? Function(T?)? validator,
  }) {
    return FormField<T>(
      key: ValueKey(selectedItem),
      initialValue: selectedItem,
      autovalidateMode: autovalidateMode ?? AutovalidateMode.onUserInteraction,
      validator: validator,
      builder: (FormFieldState<T> state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                RichText(
                  text: TextSpan(
                    text: LocaleKeys.declareInfo_gender.tr,
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
                ...options.map(
                  (e) => Expanded(
                    child: UtilWidget.buildRadioWithTitle<T>(
                      value: e,
                      groupValue: state.value,
                      title: getTitle(e),
                      onChanged: (value) {
                        state.didChange(value);
                        onChanged?.call(value);
                      },
                    ),
                  ),
                ),
              ],
            ),
            if (state.hasError)
              Padding(
                padding: const EdgeInsets.only(left: AppDimens.paddingSmall),
                child: Text(
                  state.errorText ?? '',
                  style: AppTextStyle.font12Re.copyWith(
                    color: AppColors.statusRed,
                  ),
                ),
              ),
          ],
        );
      },
    );
  }

  static Widget buildButtonBackAppbar({
    Color? color,
    VoidCallback? onTap,
  }) {
    return InkWell(
      onTap: onTap ?? Get.back,
      child: SDSImageSvg(
        Assets.ASSETS_ICONS_IC_ARROW_LEFT_SVG,
        fit: BoxFit.none,
        color: color ?? AppColors.colorBlack,
      ),
    );
  }

  static Widget buildCircleCheckbox({
    required bool isChecked,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 20,
        height: 20,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: isChecked ? AppColors.primaryColor : Colors.grey,
            width: 2,
          ),
        ),
        child: isChecked
            ? Center(
                child: Container(
                  width: 10,
                  height: 10,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.primaryColor,
                  ),
                ),
              )
            : null,
      ),
    );
  }
}
