import 'package:flutter_svg/svg.dart';
import 'package:v_bhxh/modules/src.dart';

// Dùng thay thế cho UtilWidgets.buildInputSelectDate
class CardInputSelectDateWithLabel extends StatelessWidget {
  final String labelText;
  final TextStyle? textStyle;
  final TextEditingController controller;
  final bool isRequired;
  final String? hintText;
  final FormFieldValidator<String>? validator;
  final VoidCallback? onSelectDate;
  final void Function(String)? onChanged;
  final int inputFormatters;
  final double? borderRadius;
  final GlobalKey? fieldKey;
  final AutovalidateMode? autovalidateMode;

  const CardInputSelectDateWithLabel({
    super.key,
    required this.labelText,
    this.textStyle,
    required this.controller,
    required this.isRequired,
    this.hintText,
    this.validator,
    this.onSelectDate,
    this.onChanged,
    required this.inputFormatters,
    this.borderRadius,
    this.fieldKey,
    this.autovalidateMode,
  });
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(AppDimens.radius8),
            ),
            color: AppColors.basicWhite,
          ),
          child: Padding(
            padding: const EdgeInsets.only(
              left: AppDimens.defaultPadding,
              top: AppDimens.paddingVerySmall,
            ),
            child: Row(
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
          ),
        ),
        BuildInputText(
          InputTextModel(
            fieldKey: fieldKey,
            controller: controller,
            isValidate: isRequired,
            autovalidateMode: autovalidateMode,
            inputFormatters: inputFormatters,
            isShowCounterText: false,
            suffixIcon: Container(
              padding: const EdgeInsets.only(right: AppDimens.defaultPadding),
              decoration: BoxDecoration(
                color: AppColors.basicWhite,
                borderRadius: BorderRadius.horizontal(
                  right: Radius.circular(
                    borderRadius ?? AppDimens.radius8,
                  ),
                ),
              ),
              child: InkWell(
                onTap: onSelectDate,
                child: SvgPicture.asset(
                  Assets.ASSETS_ICONS_IC_CALENDAR_SVG,
                  width: AppDimens.sizeIconMedium,
                  height: AppDimens.sizeIconMedium,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            showIconClear: true,
            hintText: hintText,
            contentPadding: const EdgeInsets.only(
              bottom: AppDimens.paddingSmall,
              left: AppDimens.defaultPadding,
              right: AppDimens.defaultPadding,
            ),
            isDense: true,
            textInputType: TextInputType.number,
            border: _buildOutlineInputNoBorder(),
            errorBorder: _buildOutlineInputNoBorder(),
            focusedBorder: _buildOutlineInputNoBorder(),
            enabledBorder: _buildOutlineInputNoBorder(),
            disabledBorder: _buildOutlineInputNoBorder(),
            focusedErrorBorder: _buildOutlineInputNoBorder(),
            validator: validator,
            onChanged: onChanged,
          ),
        ),
      ],
    );
  }

  OutlineInputBorder _buildOutlineInputNoBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(borderRadius ?? AppDimens.radius10)),
      borderSide: BorderSide.none,
    );
  }
}
