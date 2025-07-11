import 'package:v_bhxh/modules/src.dart';

// Dùng thay thế cho UtilWidgets.buildDropDownWithLabel2
class CardDropdownWithLabel<T> extends StatelessWidget {
  final String labelText;
  final TextStyle? textStyle;
  final bool? isRequired;
  final String? hintText;
  final String? Function(T?)? validator;
  final List<T> items;
  final String Function(T) display;
  final T? selectedItem;
  final ValueChanged<T?> onChanged;
  final double? borderRadius;
  final AutovalidateMode? autovalidateMode;
  final GlobalKey? fieldKey;

  const CardDropdownWithLabel({
    super.key,
    required this.labelText,
    this.hintText,
    this.textStyle,
    this.isRequired,
    this.validator,
    required this.items,
    required this.display,
    this.selectedItem,
    required this.onChanged,
    this.borderRadius,
    this.autovalidateMode,
    this.fieldKey,
  });

  @override
  Widget build(BuildContext context) {
    return FormField<T>(
      key: fieldKey,
      autovalidateMode: autovalidateMode ?? AutovalidateMode.onUserInteraction,
      validator: validator,
      initialValue: selectedItem,
      builder: (FormFieldState<T> state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildCardDropdownWithLabel(
              items: items,
              display: display,
              hintText: hintText ?? "--Chọn--",
              labelText: labelText,
              selectedItem: selectedItem,
              isDense: true,
              borderRadius: borderRadius,
              onChanged: (value) {
                state.didChange(value);
                onChanged(value);
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

  Widget _buildCardDropdownWithLabel({
    required List<T> items,
    required String Function(T) display,
    T? selectedItem,
    ValueChanged<T?>? onChanged,
    required String labelText,
    String? hintText,
    bool isDense = false,
    double? borderRadius,
  }) {
    return Container(
      padding: const EdgeInsets.only(
        right: AppDimens.defaultPadding,
        left: AppDimens.defaultPadding,
        top: AppDimens.paddingVerySmall,
      ),
      decoration: BoxDecoration(
        color: AppColors.colorWhite,
        borderRadius: BorderRadius.circular(borderRadius ?? AppDimens.radius10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              SDSBuildText(
                labelText,
                style: textStyle ??
                    AppTextStyle.font14Re.copyWith(
                      color: AppColors.dsGray1,
                    ),
              ),
              Visibility(
                visible: isRequired ?? false,
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
          DropdownButtonHideUnderline(
            child: DropdownButton<T>(
              isDense: isDense,
              isExpanded: true,
              padding: const EdgeInsets.only(
                bottom: AppDimens.paddingVerySmall,
              ),
              value: selectedItem,
              onChanged: onChanged,
              dropdownColor: AppColors.colorWhite,
              icon: SDSImageSvg(
                Assets.ASSETS_ICONS_IC_ARROW_DOWN_SVG,
                height: AppDimens.sizeIconMedium,
                width: AppDimens.sizeIconMedium,
              ),
              hint: hintText != null
                  ? SDSBuildText(
                      hintText,
                      style: AppTextStyle.font14Re.copyWith(
                        color: AppColors.dsGray3,
                      ),
                      overflow: TextOverflow.ellipsis,
                    )
                  : null,
              selectedItemBuilder: (context) => items.map(
                (e) {
                  return Align(
                    alignment: Alignment.centerLeft,
                    child: SDSBuildText(
                      display(e),
                      style: AppTextStyle.font14Re,
                      maxLines: 2,
                      textAlign: TextAlign.start,
                      overflow: TextOverflow.ellipsis,
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
                          textAlign: TextAlign.start,
                          overflow: TextOverflow.visible,
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}
