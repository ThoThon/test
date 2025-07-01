import 'package:v_bhxh/modules/src.dart';

// Dùng thay thế cho BuildInputTextWithLabel
class CardInputTextFormWithLabel extends StatelessWidget {
  final String labelText;
  final TextStyle? textStyle;
  final TextEditingController controller;
  final String? hintText;
  final int? inputFormatters;
  final int? maxLengthInputForm;
  final String? Function(String?)? validator;
  final double? borderRadius;
  final bool obscureText;
  final bool isShowCounterText;
  final TextInputType textInputType;
  final bool isRequired;
  final void Function(String)? onChanged;
  final AutovalidateMode? autovalidateMode;
  final bool isReadOnly;
  final Widget? suffixIcon;

  const CardInputTextFormWithLabel({
    super.key,
    required this.labelText,
    this.textStyle,
    required this.controller,
    this.hintText,
    this.inputFormatters,
    this.maxLengthInputForm,
    this.validator,
    this.borderRadius,
    this.obscureText = false,
    this.isShowCounterText = false,
    this.textInputType = TextInputType.text,
    this.isRequired = false,
    this.onChanged,
    this.autovalidateMode,
    this.isReadOnly = false,
    this.suffixIcon,
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
              top: Radius.circular(AppDimens.radius10),
            ),
            color: AppColors.basicWhite,
          ),
          child: Padding(
            padding: const EdgeInsets.only(
              left: AppDimens.defaultPadding,
              right: AppDimens.defaultPadding,
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
            isValidate: isRequired,
            autovalidateMode: autovalidateMode,
            controller: controller,
            hintText: hintText ?? 'Nhập ${labelText.toLowerCase()}',
            maxLengthInputForm: maxLengthInputForm,
            inputFormatters: inputFormatters ?? InputFormatterEnum.textNormal,
            obscureText: obscureText,
            suffixIcon: suffixIcon,
            isShowCounterText: isShowCounterText,
            border: _buildOutlineInputNoBorder(),
            errorBorder: _buildOutlineInputNoBorder(),
            focusedBorder: _buildOutlineInputNoBorder(),
            enabledBorder: _buildOutlineInputNoBorder(),
            disabledBorder: _buildOutlineInputNoBorder(),
            focusedErrorBorder: _buildOutlineInputNoBorder(),
            onChanged: onChanged,
            isReadOnly: isReadOnly,
            contentPadding: const EdgeInsets.only(
              bottom: AppDimens.paddingSmall,
              left: AppDimens.defaultPadding,
              right: AppDimens.defaultPadding,
            ),
            isDense: true,
            validator: validator,
            textInputType: textInputType,
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
