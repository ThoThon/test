import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:v_bhxh/modules/declaration_tax_code/ui/ui_src.dart';

class SDSDropdown extends StatelessWidget {
  final Map<int?, String> mapData;
  final RxInt? item;
  final double height;
  final Function(int?)? onChanged;
  final bool showBorder;
  final bool isExpanded;
  final double? paddingIcon;

  const SDSDropdown({
    super.key,
    required this.mapData,
    required this.item,
    this.height = AppDimens.size45,
    this.onChanged,
    this.showBorder = false,
    this.isExpanded = true,
    this.paddingIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => DropdownButtonHideUnderline(
        child: DropdownButton2<int>(
          isExpanded: isExpanded,
          items: mapData.entries.map(
            (entry) {
              return DropdownMenuItem<int>(
                value: entry.key,
                child: TextUtils(
                  text: entry.value,
                  color: AppColors.colorBlack,
                  // entry.key == item?.value
                  //     ? AppColors.primaryColor
                  //     : AppColors.dsGray1,
                  textAlign: TextAlign.start,
                ),
              );
            },
          ).toList(),
          value: item?.value,
          onChanged: (value) {
            item?.value = value ?? 0; // Đảm bảo không null
            if (onChanged != null) {
              onChanged!(value);
            }
          },
          buttonStyleData: ButtonStyleData(
            height: height,
            decoration: BoxDecoration(
              color: AppColors.colorWhite,
              borderRadius: BorderRadius.circular(AppDimens.radius4),
              border: showBorder
                  ? Border.all(
                      color: AppColors.dsGray4,
                    )
                  : null,
            ),
          ),
          dropdownStyleData: DropdownStyleData(
            decoration: BoxDecoration(
              color: AppColors.colorWhite,
              borderRadius: BorderRadius.circular(AppDimens.radius8),
            ),
          ),
          iconStyleData: IconStyleData(
            icon: SDSImageSvg(
              Assets.ASSETS_ICONS_IC_DROPDOWN_SVG,
              height: AppDimens.sizeIcon,
            ).paddingOnly(right: paddingIcon ?? AppDimens.paddingSmallest),
            iconEnabledColor: AppColors.dsGray4,
          ),
        ),
      ),
    );
  }
}
