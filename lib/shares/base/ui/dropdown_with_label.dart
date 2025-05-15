import 'package:flutter/material.dart';
import 'package:v_bhxh/core/theme/colors.dart';
import 'package:v_bhxh/core/values/dimens.dart';
import 'package:v_bhxh/shares/base/base.src.dart';
import 'package:v_bhxh/shares/shares.src.dart';

class DropdownWithLabel extends StatelessWidget {
  final String label;
  // final TextStyle? textStyle;
  final StyleEnum? textStyle;
  final bool isRequired;
  final RxInt? item;
  final Map<int?, String> mapData;
  const DropdownWithLabel({
    super.key,
    required this.label,
    this.textStyle,
    this.isRequired = false,
    this.item,
    required this.mapData,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: label.isStringNotEmpty
              ? const EdgeInsets.only(bottom: AppDimens.paddingSmallest)
              : EdgeInsets.zero,
          child: Row(
            children: [
              TextUtils(
                text: label,
                availableStyle: textStyle ?? StyleEnum.subBold,
                color: AppColors.dsGray1,
              ),
              Visibility(
                  visible: isRequired,
                  child:
                      // SDSBuildText(
                      //   ' (*)',
                      //   fontSize: AppDimens.sizeTextSmaller,
                      //   color: AppColors.statusRed,
                      // ),
                      const TextUtils(
                    text: ' (*)',
                    availableStyle: StyleEnum.detailRegular,
                    color: AppColors.statusRed,
                  )),
            ],
          ),
        ),
        SDSDropdown(
          mapData: mapData,
          item: item,
          showBorder: true,
          paddingIcon: AppDimens.defaultPadding,
        ),
      ],
    );
  }
}
