import 'package:v_bhxh/modules/src.dart';

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
              color: AppColors.basicWhite),
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
            controller: controller,
            hintText: hintText ?? 'Nhập ${labelText.toLowerCase()}',
            maxLengthInputForm: maxLengthInputForm,
            inputFormatters: inputFormatters ?? InputFormatterEnum.textNormal,
            obscureText: obscureText,
            isShowCounterText: isShowCounterText,
            border: _buildOutlineInputNoBorder(),
            errorBorder: _buildOutlineInputNoBorder(),
            focusedBorder: _buildOutlineInputNoBorder(),
            enabledBorder: _buildOutlineInputNoBorder(),
            disabledBorder: _buildOutlineInputNoBorder(),
            focusedErrorBorder: _buildOutlineInputNoBorder(),
            contentPadding: const EdgeInsets.only(
              bottom: AppDimens.paddingSmall,
              left: AppDimens.defaultPadding,
              right: AppDimens.defaultPadding,
            ),
            isDense: true,
            validator: (value) {
              if (!isRequired) return null;

              if (validator != null) {
                return validator!(value);
              }

              if (value.isNullOrEmpty) {
                return "${labelText.tr} ${LocaleKeys.input_inputEmpty.tr.toLowerCase()}";
              }

              return null;
            },
            textInputType: textInputType,
          ),
        ),
      ],
    );
  }

  OutlineInputBorder _buildOutlineInputNoBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(borderRadius ?? AppDimens.radius8),
      borderSide: BorderSide.none,
    );
  }
}
