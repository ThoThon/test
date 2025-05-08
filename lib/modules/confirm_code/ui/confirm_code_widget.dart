part of 'confirm_code_page.dart';

extension ConfirmCodeWidgetPage on ConfirmCodePage {
  Widget _buildBody() {
    return Padding(
      padding: const EdgeInsets.only(top: AppDimens.paddingMedium),
      child: Align(
        alignment: Alignment.topCenter,
        child: Column(
          children: [
            TextUtils(
              text: LocaleKeys.awaitConfirmSign_inputPinCode.tr,
              availableStyle: StyleEnum.bodyBold,
              textAlign: TextAlign.center,
            ).paddingOnly(bottom: AppDimens.defaultPadding),
            TextUtils(
              text: LocaleKeys.awaitConfirmSign_pleaseInputPinCode.tr,
              availableStyle: StyleEnum.bodyRegular,
              textAlign: TextAlign.center,
            ),
            sdsSBHeight20,
            _pinCodeOTP(controller),
          ],
        ),
      ),
    );
  }

  Widget _pinCodeOTP(PinCodeControllerICare controller) {
    return PinCodeTextField(
      length: 6,
      obscureText: false,
      obscuringWidget: Container(
        width: AppDimens.paddingMedium,
        height: AppDimens.paddingMedium,
        decoration: const BoxDecoration(
          color: AppColors.primaryColor,
          shape: BoxShape.circle,
        ),
      ),
      animationType: AnimationType.fade,
      autoFocus: true,
      focusNode: controller.pinCodeFocusNode,
      pinTheme: PinTheme(
        shape: PinCodeFieldShape.circle,
        borderRadius: BorderRadius.circular(AppDimens.paddingSmallest),
        fieldHeight: AppDimens.paddingMedium / ratioHeight,
        fieldWidth: AppDimens.paddingMedium / ratioHeight,
        activeFillColor: AppColors.primaryColor,
        inactiveColor: AppColors.primaryColor,
        activeColor: AppColors.primaryColor,
        selectedColor: AppColors.primaryColor,
        inactiveFillColor: AppColors.primaryColor,
        selectedFillColor: AppColors.primaryColor,
        activeBorderWidth: 1.0,
        selectedBorderWidth: 1.0,
        inactiveBorderWidth: 1.0,
        disabledBorderWidth: 1.0,
      ),
      cursorColor: AppColors.colorTransparent,
      cursorWidth: 0,
      cursorHeight: AppDimens.paddingVerySmall / ratioHeight,
      animationDuration: const Duration(milliseconds: 300),
      enableActiveFill: false,
      keyboardType: TextInputType.number,
      controller: controller.textEditingController,
      onChanged: (value) {
        controller.pinCode.value = value;
      },
      onCompleted: (v) async {
        await controller.sendConfirmSign();
      },
      beforeTextPaste: (text) {
        return true;
      },
      appContext: Get.context!,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    );
  }
}
