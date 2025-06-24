import 'package:v_bhxh/modules/src.dart';

class CardDropdownWithLabel<T> extends StatelessWidget {
  final String labelText;
  final TextStyle? textStyle;
  final bool isValidate;
  // final String? hintText;
  final String? Function(String?)? validator;
  final List<T> items;
  final String Function(T) display;
  final T? selectedItem;
  final ValueChanged<T?> onChanged;

  const CardDropdownWithLabel({
    super.key,
    required this.labelText,
    this.textStyle,
    required this.isValidate,
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
      validator: isValidate
          ? (value) {
              if (validator != null) {
                return validator!(value?.toString());
              }
              if (value == null) {
                return "${labelText.tr} ${LocaleKeys.input_inputEmpty.tr.toLowerCase()}";
              }
              return null;
            }
          : null,
      initialValue: selectedItem,
      builder: (FormFieldState<T> state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildCardDropdownWithLabel(
              items: items,
              display: display,
              hintText: "Chọn ${labelText.toLowerCase()}",
              labelText: labelText,
              selectedItem: selectedItem,
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
  }) {
    return Container(
      padding: const EdgeInsets.only(
        right: AppDimens.paddingSmall,
        left: AppDimens.paddingSmall,
        top: AppDimens.paddingSmall,
      ),
      decoration: BoxDecoration(
        color: AppColors.colorWhite,
        borderRadius: BorderRadius.circular(AppDimens.radius4),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RichText(
            text: TextSpan(
              text: labelText,
              style: AppTextStyle.font14Re,
              children: [
                if (isValidate)
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
          DropdownButtonHideUnderline(
            child: DropdownButton<T>(
              isExpanded: true,
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
