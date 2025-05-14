import 'package:v_bhxh/modules/src.dart';

class BuildInputTextWithLabel extends StatelessWidget {
  final BuildInputText buildInputText;
  final String label;
  final TextStyle? textStyle;

  const BuildInputTextWithLabel({
    super.key,
    required this.label,
    required this.buildInputText,
    this.textStyle,
  });
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: label.isStringNotEmpty
              ? const EdgeInsets.only(bottom: AppDimens.paddingSmallest)
              : EdgeInsets.zero,
          child: Row(
            children: [
              SDSBuildText(
                label,
                style: textStyle ??
                    AppTextStyle.font12Bo.copyWith(
                      color: AppColors.dsGray1,
                    ),
              ),
              Visibility(
                visible: buildInputText.inputTextFormModel.isValidate,
                child: SDSBuildText(
                  ' (*)',
                  style: AppTextStyle.font12Re.copyWith(
                    color: AppColors.statusRed,
                  ),
                ),
              ),
            ],
          ),
        ),
        buildInputText
          ..inputTextFormModel.hintText =
              buildInputText.inputTextFormModel.hintText ??
                  "Nhập ${label.toLowerCase()}"
          ..inputTextFormModel.validator =
              buildInputText.inputTextFormModel.validator ??
                  (val) {
                    if (buildInputText.inputTextFormModel.isValidate) {
                      if (val.isNullOrEmpty) {
                        return "$label ${LocaleKeys.input_inputEmpty.tr.toLowerCase()}";
                      }
                      return null;
                    }

                    return null;
                  },
      ],
    );
  }
}
