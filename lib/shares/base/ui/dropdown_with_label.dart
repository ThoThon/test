import '../../../modules/src.dart';

class DropdownWithLabel extends StatelessWidget {
  final String label;
  final TextStyle? textStyle;
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
              SDSBuildText(
                label,
                style: textStyle ??
                    AppTextStyle.font16Bo.copyWith(
                      color: AppColors.dsGray1,
                    ),
              ),
              Visibility(
                  visible: isRequired,
                  child:
                      // SDSBuildText(
                      //   ' (*)',
                      //   fontSize: AppDimens.sizeTextSmaller,
                      //   color: AppColors.statusRed,
                      // ),
                      SDSBuildText(
                    ' (*)',
                    style: AppTextStyle.font12Re.copyWith(
                      color: AppColors.statusRed,
                    ),
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
