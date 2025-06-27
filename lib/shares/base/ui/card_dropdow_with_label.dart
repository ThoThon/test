import 'package:v_bhxh/modules/src.dart';

class CardDropdownWithLabel<T> extends StatelessWidget {
  final String labelText;
  final TextStyle? textStyle;
  final bool isRequired;
  final String? hintText;
  final String? Function(T?)? validator;
  final List<T> items;
  final String Function(T) display;
  final T? selectedItem;
  final ValueChanged<T?> onChanged;

  const CardDropdownWithLabel({
    super.key,
    required this.labelText,
    this.hintText,
    this.textStyle,
    required this.isRequired,
    this.validator,
    required this.items,
    required this.display,
    this.selectedItem,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return FormField<T>(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: validator,
      initialValue: selectedItem,
      builder: (FormFieldState<T> state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildCardDropdownWithLabel(
              items: items,
              display: display,
              hintText: hintText ?? "Chọn ${labelText.toLowerCase()}",
              labelText: labelText,
              selectedItem: selectedItem,
              isDense: true,
              padding:
                  const EdgeInsets.only(bottom: AppDimens.paddingVerySmall),
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
    EdgeInsetsGeometry? padding,
    bool isDense = false,
    double? borderRadius,
  }) {
    return Container(
      padding: const EdgeInsets.only(
        right: AppDimens.defaultPadding,
        left: AppDimens.defaultPadding,
        top: AppDimens.paddingSmall,
      ),
      decoration: BoxDecoration(
        color: AppColors.colorWhite,
        borderRadius: BorderRadius.circular(borderRadius ?? AppDimens.radius8),
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
          DropdownButtonHideUnderline(
            child: DropdownButton<T>(
              isDense: isDense,
              isExpanded: true,
              padding: padding,
              value: selectedItem,
              onChanged: onChanged,
              dropdownColor: AppColors.colorWhite,
              hint: hintText != null
                  ? SDSBuildText(
                      hintText,
                      style: AppTextStyle.font14Re.copyWith(
                        color: AppColors.dsGray3,
                      ),
                      maxLines: 2,
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
