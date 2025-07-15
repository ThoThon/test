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
    DateTime? selectedDate = dateTimeInit;

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
          left: AppDimens.paddingVerySmall,
        ),
        actionsPadding: const EdgeInsets.only(
          right: AppDimens.defaultPadding,
          left: AppDimens.paddingVerySmall,
          bottom: AppDimens.paddingSmall,
        ),
        title: Center(
          child: SDSBuildText(
            title,
            style: AppTextStyle.font18Bo,
          ),
        ),
        content: DatePickerWidget(
          looping: false,
          firstDate: firstDate ?? DateTime(1901),
          lastDate: lastDate ?? DateTime(2099),
          initialDate: dateTimeInit,
          dateFormat: dateFormat,
          onChange: (DateTime newDate, _) {
            selectedDate = newDate;
          },
          pickerTheme: DateTimePickerTheme(
            itemTextStyle:
                AppTextStyle.font16Bo.copyWith(color: AppColors.dsGray1),
            dividerColor: AppColors.dsGray7,
            dividerSpacing: 0,
            dividerHeight: 1,
            itemHeight: 50,
            diameterRatio: 100,
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
