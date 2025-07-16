import 'package:flutter_holo_date_picker/flutter_holo_date_picker.dart';

import '../../../modules/src.dart';

class DatePickerUtils {
  static Future<DateTime?> showCalendarPicker({
    required String title,
    required String dateFormat,
    DateTime? dateTimeInit,
    DateTime? firstDate,
    DateTime? lastDate,
    EdgeInsetsGeometry? contentPadding,
  }) {
    final minDate = firstDate ?? DateTime(1901);
    final maxDate = lastDate ?? DateTime(2099, 12, 31);
    DateTime? selectedDate = dateTimeInit != null &&
            dateTimeInit.isAfter(minDate) &&
            dateTimeInit.isBefore(maxDate)
        ? dateTimeInit
        : DateTime.now();
    return Get.dialog<DateTime?>(
      AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        backgroundColor: AppColors.basicWhite,
        contentPadding: contentPadding ??
            const EdgeInsets.symmetric(horizontal: AppDimens.padding80),
        titlePadding: const EdgeInsets.only(
          top: AppDimens.defaultPadding,
          right: AppDimens.paddingVerySmall,
          left: AppDimens.defaultPadding,
        ),
        actionsPadding: const EdgeInsets.only(
          right: AppDimens.defaultPadding,
          left: AppDimens.paddingVerySmall,
          bottom: AppDimens.paddingSmall,
        ),
        title: SDSBuildText(
          title,
          style: AppTextStyle.font14Bo,
        ),
        content: DatePickerWidget(
          looping: true,
          firstDate: minDate,
          lastDate: maxDate,
          initialDate: selectedDate,
          dateFormat: dateFormat,
          onChange: (newDate, _) {
            selectedDate = newDate;
          },
          pickerTheme: DateTimePickerTheme(
            itemTextStyle:
                AppTextStyle.font20Bo.copyWith(color: AppColors.dsGray1),
            dividerColor: AppColors.dsGray7,
            dividerSpacing: 0,
            dividerHeight: 1,
            itemHeight: 40,
            pickerHeight: 200,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Get.back();
            },
            child: SDSBuildText(
              LocaleKeys.dialog_cancel.tr,
              style: AppTextStyle.font14Bo
                  .copyWith(color: AppColors.textColorGrey),
            ),
          ),
          TextButton(
            onPressed: () {
              Get.back(result: selectedDate);
            },
            child: SDSBuildText(
              LocaleKeys.dialog_select.tr,
              style:
                  AppTextStyle.font14Bo.copyWith(color: AppColors.primaryColor),
            ),
          ),
        ],
      ),
      barrierDismissible: false,
    );
  }
}
