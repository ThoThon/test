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
  final Color? fillColor;
  final bool enable;
  final GlobalKey? fieldKey;
  final TextInputAction? textInputAction;

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
    this.fillColor,
    this.enable = true,
    this.fieldKey,
    this.textInputAction,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(AppDimens.radius10),
                ),
                color: fillColor ?? AppColors.basicWhite,
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
                fieldKey: fieldKey,
                autovalidateMode: autovalidateMode,
                isValidate: isRequired,
                controller: controller,
                isReadOnly: isReadOnly,
                textInputAction: textInputAction,
                fillColor: fillColor,
                hintText: hintText ?? 'Nhập ${labelText.toLowerCase()}',
                maxLengthInputForm: maxLengthInputForm,
                inputFormatters:
                    inputFormatters ?? InputFormatterEnum.textNormal,
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
        ),
        if (!enable)
          Positioned.fill(
            child: Container(
              padding: const EdgeInsets.all(AppDimens.paddingSmall),
              decoration: BoxDecoration(
                color: Colors.black12,
                borderRadius: BorderRadius.circular(AppDimens.radius10),
                border: Border.all(
                  color: AppColors.dsGray4,
                ),
              ),
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
