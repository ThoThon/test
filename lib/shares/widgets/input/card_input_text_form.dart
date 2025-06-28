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
  final void Function(String)? onChanged;

  const CardInputTextForm({
    super.key,
    this.styleHintText,
    required this.controller,
    required this.hintText,
    this.inputFormatters,
    this.maxLengthInputForm,
    this.validator,
    this.borderRadius,
    this.obscureText = false,
    this.isShowCounterText = true,
    // Đầu vào bàn phím
    this.textInputType = TextInputType.text,
    this.showIconClear = true,
    this.onChanged,
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
            onChanged: onChanged,
            isShowCounterText: isShowCounterText,
            border: _buildOutlineInputNoBorder(),
            errorBorder: _buildOutlineInputNoBorder(),
            focusedBorder: _buildOutlineInputNoBorder(),
            enabledBorder: _buildOutlineInputNoBorder(),
            disabledBorder: _buildOutlineInputNoBorder(),
            focusedErrorBorder: _buildOutlineInputNoBorder(),
            validator: validator,
            textInputType: textInputType,
          ),
        ),
      ],
    );
  }

  // Config bỏ line ở border
  OutlineInputBorder _buildOutlineInputNoBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(borderRadius ?? AppDimens.radius10),
      borderSide: BorderSide.none,
    );
  }
}
