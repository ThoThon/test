import 'package:v_bhxh/modules/src.dart';

class CardInputTextForm extends StatelessWidget {
  final TextStyle? styleHintText;
  final TextEditingController controller;
  final String hintText;
  final int? inputFormatters;
  final int? maxLengthInputForm;
  final String? Function(String?)? validator;
  final double? borderRadius;
  final bool obscureText;
  final bool isShowCounterText;
  final TextInputType textInputType;
  final bool showIconClear;

  const CardInputTextForm({
    super.key,
    this.styleHintText,
    required this.controller,
    required this.hintText,
    this.inputFormatters,
    required this.maxLengthInputForm,
    this.validator,
    this.borderRadius,
    this.obscureText = false,
    this.isShowCounterText = true,
    // Đầu vào bàn phím
    this.textInputType = TextInputType.text,
    this.showIconClear = true,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BuildInputText(
          InputTextModel(
            controller: controller,
            hintText: hintText,
            maxLengthInputForm: maxLengthInputForm,
            inputFormatters: inputFormatters ?? InputFormatterEnum.textNormal,
            obscureText: obscureText,
            showIconClear: showIconClear,
            isShowCounterText: isShowCounterText,
            border: _buildOutlineInputNoBorder(),
            errorBorder: _buildOutlineInputNoBorder(),
            focusedBorder: _buildOutlineInputNoBorder(),
            enabledBorder: _buildOutlineInputNoBorder(),
            disabledBorder: _buildOutlineInputNoBorder(),
            focusedErrorBorder: _buildOutlineInputNoBorder(),
            validator: (value) {
              if (validator != null) {
                return validator!(value);
              }

              if (value.isNullOrEmpty) {
                return "${hintText.tr} ${LocaleKeys.input_inputEmpty.tr.toLowerCase()}";
              }

              return null;
            },
            textInputType: textInputType,
          ),
        ),
      ],
    );
  }

  // Config bỏ line ở border
  OutlineInputBorder _buildOutlineInputNoBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(borderRadius ?? AppDimens.radius8),
      borderSide: BorderSide.none,
    );
  }
}
