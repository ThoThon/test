import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../core/theme/colors.dart';
import '../../../core/values/dimens.dart';
import '../../shares.src.dart';
import '../model/model.src.dart';
import 'ui.src.dart';

class BuildInputText extends StatefulWidget {
  final InputTextModel inputTextFormModel;

  const BuildInputText(
    this.inputTextFormModel, {
    super.key,
  });

  @override
  BuildInputTextState createState() => BuildInputTextState();
}

class BuildInputTextState extends State<BuildInputText> {
  final RxBool _isShowButtonClear = false.obs;
  final RxBool _showPassword = false.obs;

  @override
  void initState() {
    widget.inputTextFormModel.controller.addListener(() {
      if (widget.inputTextFormModel.controller.text.isNotEmpty) {
        _isShowButtonClear.value = true;
      }
    });
    _showPassword.value = widget.inputTextFormModel.obscureText;
    super.initState();
  }

  List<TextInputFormatter> getFormatters() {
    switch (widget.inputTextFormModel.inputFormatters) {
      case InputFormatterEnum.digitsOnly:
        return [
          FilteringTextInputFormatter.digitsOnly,
          LengthLimitingTextInputFormatter(
              widget.inputTextFormModel.maxLengthInputForm),
        ];
      case InputFormatterEnum.taxCode:
        return [
          TaxCodeFormatter(),
          FilteringTextInputFormatter.allow(RegExp(r"[0-9-]")),
          LengthLimitingTextInputFormatter(14),
        ];
      case InputFormatterEnum.textOnly:
        return [
          FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z0-9-_\.]')),
        ];
      case InputFormatterEnum.currency:
        return [
          NumericTextFormatter(),
        ];
      case InputFormatterEnum.password:
        return [
          FilteringTextInputFormatter.deny(RegExp(r'( )')),
        ];
      case InputFormatterEnum.phoneNumber:
        return [
          FilteringTextInputFormatter.allow(RegExp(r"[0-9-]")),
          LengthLimitingTextInputFormatter(20),
        ];
      case InputFormatterEnum.email:
        return [
          FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z0-9._%+-@]')),
          LengthLimitingTextInputFormatter(50),
        ];
      default:
        return [
          LengthLimitingTextFieldFormatterFixed(
              widget.inputTextFormModel.maxLengthInputForm)
        ];
    }
  }

  Widget? _suffixIcon() {
    if (widget.inputTextFormModel.suffixIcon != null) {
      return widget.inputTextFormModel.suffixIcon;
    }
    if (!_isShowButtonClear.value || widget.inputTextFormModel.isReadOnly) {
      return null;
    }
    return widget.inputTextFormModel.obscureText
        ? GestureDetector(
            onTap: () {
              _showPassword.toggle();
            },
            child: Icon(
              _showPassword.value
                  ? Icons.visibility_off_outlined
                  : Icons.remove_red_eye_outlined,
              color: widget.inputTextFormModel.suffixColor ?? AppColors.dsGray1,
            ),
          )
        : Visibility(
            visible: _isShowButtonClear.value &&
                !widget.inputTextFormModel.isReadOnly,
            child: GestureDetector(
              onTap: () {
                widget.inputTextFormModel.controller.clear();
                _isShowButtonClear.value = false;
              },
              child: Icon(
                Icons.clear,
                color:
                    widget.inputTextFormModel.suffixColor ?? AppColors.dsGray1,
              ),
            ),
          );
  }

  final BorderRadius _radius = BorderRadius.circular(AppDimens.radius4);

  BorderSide _borderSide({bool isError = false}) =>
      BorderSide(color: isError ? AppColors.statusRed : AppColors.dsGray4);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => TextFormField(
        maxLines: widget.inputTextFormModel.maxLines,
        inputFormatters: getFormatters(),
        validator: widget.inputTextFormModel.validator,
        autovalidateMode: widget.inputTextFormModel.autovalidateMode ??
            AutovalidateMode.onUserInteraction,
        onChanged: (v) {
          if (!_isShowButtonClear.value || v.isEmpty) {
            _isShowButtonClear.value = v.isNotEmpty;
          }
          widget.inputTextFormModel.onChanged?.call(v);
        },
        textInputAction: widget.inputTextFormModel.iconNextTextInputAction,
        style: FontStyleUtils.fontStyleSans(
          fontSize:
              widget.inputTextFormModel.hintTextSize ?? AppDimens.sizeTextSmall,
          color: widget.inputTextFormModel.textColor ?? AppColors.dsGray1,
        ),
        controller: widget.inputTextFormModel.controller,
        obscureText: _showPassword.value,
        onTap: widget.inputTextFormModel.onTap,
        autofocus: widget.inputTextFormModel.autoFocus,
        focusNode: widget.inputTextFormModel.focusNode,
        textAlign: widget.inputTextFormModel.textAlign,
        keyboardType: widget.inputTextFormModel.textInputType,
        readOnly: widget.inputTextFormModel.isReadOnly,
        maxLength: widget.inputTextFormModel.maxLengthInputForm,
        onFieldSubmitted: (v) {
          if (widget.inputTextFormModel.submitFunc != null) {
            widget.inputTextFormModel.submitFunc!.call(v);
          } else if (widget.inputTextFormModel.iconNextTextInputAction
                  .toString() ==
              TextInputAction.next.toString()) {
            FocusScope.of(context)
                .requestFocus(widget.inputTextFormModel.nextNode);

            widget.inputTextFormModel.onNext?.call(v);
          }
        },
        decoration: InputDecoration(
          counterText: widget.inputTextFormModel.isShowCounterText ? null : '',
          filled: true,
          fillColor:
              widget.inputTextFormModel.fillColor ?? AppColors.colorWhite,
          hintStyle: FontStyleUtils.fontStyleSans(
            fontSize: AppDimens.sizeTextSmall,
            color: widget.inputTextFormModel.hintTextColor ?? AppColors.dsGray3,
          ),
          hintText: widget.inputTextFormModel.hintText,
          errorStyle: FontStyleUtils.fontStyleSans(
            fontSize: AppDimens.sizeTextSmaller,
            color:
                widget.inputTextFormModel.errorTextColor ?? AppColors.statusRed,
          ),
          errorMaxLines: 2,
          prefixIcon: widget.inputTextFormModel.iconLeading != null
              ? Icon(
                  widget.inputTextFormModel.iconLeading,
                  color: widget.inputTextFormModel.prefixIconColor ??
                      Colors.black54,
                  size: 20,
                )
              : (widget.inputTextFormModel.iconAssets != null
                  ? SizedBox(
                      width: AppDimens.sizeIconDefault,
                      height: AppDimens.sizeIconDefault,
                      child: Center(
                        child: SDSImageSvg(
                          widget.inputTextFormModel.iconAssets!,
                        ),
                      ),
                    )
                  : null),
          prefixStyle:
              const TextStyle(color: Colors.red, backgroundColor: Colors.white),
          border: widget.inputTextFormModel.border ?? InputBorder.none,
          contentPadding: widget.inputTextFormModel.contentPadding ??
              const EdgeInsets.all(AppDimens.paddingSmall),
          suffixIcon:
              widget.inputTextFormModel.showIconClear ? _suffixIcon() : null,
          focusedBorder: widget.inputTextFormModel.focusedBorder ??
              OutlineInputBorder(
                borderRadius: _radius,
                borderSide: _borderSide(),
              ),
          errorBorder: widget.inputTextFormModel.errorBorder ??
              OutlineInputBorder(
                borderRadius: _radius,
                borderSide: _borderSide(isError: true),
              ),
          enabledBorder: widget.inputTextFormModel.enabledBorder ??
              OutlineInputBorder(
                borderRadius: _radius,
                borderSide: _borderSide(),
              ),
          disabledBorder: widget.inputTextFormModel.disabledBorder,
          focusedErrorBorder: widget.inputTextFormModel.focusedErrorBorder ??
              OutlineInputBorder(
                borderRadius: _radius,
                borderSide: _borderSide(isError: true),
              ),
        ),
      ),
    );
  }
}
