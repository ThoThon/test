import 'package:flutter_svg/svg.dart';
import 'package:v_bhxh/modules/src.dart';

class CardInputSelectDateWithLabel extends StatelessWidget {
  final String labelText;
  final TextStyle? textStyle;
  final TextEditingController controller;
  final bool isValidate;
  final int? maxLengthInputForm;
  final String? hintText;
  final FormFieldValidator<String>? validator;
  final VoidCallback? onSelectDate;
  final void Function(String)? onChanged;
  final int inputFormatters;

  const CardInputSelectDateWithLabel({
    super.key,
    required this.labelText,
    this.textStyle,
    required this.controller,
    required this.isValidate,
    this.maxLengthInputForm,
    this.hintText,
    this.validator,
    this.onSelectDate,
    this.onChanged,
    required this.inputFormatters,
  });
  @override
  Widget build(BuildContext context) {
    return BuildInputText(
      InputTextModel(
        controller: controller,
        isValidate: isValidate,
        label: Row(
          children: [
            SDSBuildText(
              labelText,
              style: textStyle ??
                  AppTextStyle.font16Re.copyWith(
                    color: AppColors.dsGray1,
                  ),
            ),
            Visibility(
              visible: isValidate,
              child: SDSBuildText(
                ' *',
                style: AppTextStyle.font12Re.copyWith(
                  color: AppColors.statusRed,
                ),
              ),
            ),
          ],
        ),
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
        isShowCounterText: false,
        showIconClear: true,
        maxLengthInputForm: maxLengthInputForm,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        hintText: hintText ?? "Nhập ${labelText.toLowerCase()}",
        contentPadding: const EdgeInsets.only(
          bottom: AppDimens.paddingVerySmall,
          left: AppDimens.paddingSmall,
          right: AppDimens.paddingSmall,
          top: AppDimens.paddingSmall,
        ),
        textInputType: TextInputType.number,
        border: InputBorder.none,
        enabledBorder: InputBorder.none,
        focusedBorder: InputBorder.none,
        errorBorder: InputBorder.none,
        focusedErrorBorder: InputBorder.none,
        validator: validator,
        onChanged: onChanged,
      ),
    );
  }
}
