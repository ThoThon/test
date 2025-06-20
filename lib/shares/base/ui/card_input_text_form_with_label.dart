import 'package:v_bhxh/modules/src.dart';

class CardInputTextFormWithLabel extends StatelessWidget {
  final String labelText;
  final TextStyle? textStyle;
  final TextEditingController controller;
  final bool isValidate;
  final int? maxLengthInputForm;
  final String? hintText;
  final String? Function(String?)? validator;

  const CardInputTextFormWithLabel({
    super.key,
    required this.labelText,
    this.textStyle,
    required this.controller,
    required this.isValidate,
    this.maxLengthInputForm,
    this.hintText,
    this.validator,
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
        border: InputBorder.none,
        enabledBorder: InputBorder.none,
        focusedBorder: InputBorder.none,
        errorBorder: InputBorder.none,
        focusedErrorBorder: InputBorder.none,
        validator: validator ??
            (val) {
              if (isValidate) {
                if (val.isNullOrEmpty) {
                  return "$labelText ${LocaleKeys.input_inputEmpty.tr.toLowerCase()}";
                }
                return null;
              }

              return null;
            },
      ),
    );
  }
}
