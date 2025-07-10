part of 'register_code_page.dart';

extension RegisterInfoTab on RegisterCodePage {
  Widget _buildRegisterInfoTab() {
    return Form(
      key: controller.formKeyRegisterTab,
      child: KeyboardVisibilityBuilder(
        builder: (context, isKeyboardVisible) {
          return Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildBhxhInfoCard(),
                      sdsSBHeight12,
                      _buildOtherInfoCard(),
                      sdsSBHeight12,
                      _buildSelectUploadFile(),
                      _buidHideImage(),
                      sdsSBHeight12,
                      SDSBuildText(
                        LocaleKeys.registerCode_signature.tr,
                        style: AppTextStyle.font16Bo,
                      ),
                      sdsSBHeight12,
                      _buildInputUsernameMySign(),
                      _buildCardSignatureInfo(),
                    ],
                  ),
                ),
              ),
              sdsSBHeight12,
              // Button "Quay lại" và "Đăng ký"
              _buildDoubleButton(),
            ],
          );
        },
      ),
    );
  }

  Widget _buildBhxhInfoCard() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SDSBuildText(
          LocaleKeys.registerCode_socialInfo.tr,
          style: AppTextStyle.font16Bo,
        ),
        sdsSBHeight12,
        // Cơ quan BHXH
        _buildSelectBhxhAgency(),

        // Nơi nhận tỉnh
        _buildSelectProvinceReceive(),

        // Nơi nhận huyện
        _buildSelectDistrictReceive(),

        // Nơi nhận xã
        _buildSelectWardReceive(),

        // Đăng ký nhận kết quả
        _buildSelectRegisterResult(),
      ],
    );
  }

  // Cơ quan BHXH
  Widget _buildSelectBhxhAgency() {
    return UtilWidget.buildCardBottomSheetSelect2(
      label: LocaleKeys.registerCode_socialSecurityAgency.tr,
      funcSelect: (didChange) {
        Get.bottomSheet(
          BottomSheetSearch<SocialAgencyModel>(
            title: LocaleKeys.registerCode_selectSocialAgency.tr,
            maxLength: 20,
            listFilter: AppData.instance.socialAgency.toList(),
            selectedItem: controller.socialAgency.value,
            display: (value) => value.tenCoQuanBHXH,
            onAccept: (value) {
              if (value == null) return;
              controller.socialAgency.value = value;
              didChange(value);
            },
          ),
          isScrollControlled: true,
        );
      },
      selectedItem: controller.socialAgency.value,
      display: (item) => item.tenCoQuanBHXH,
      validator: (value) {
        if (controller.socialAgency.value == null) {
          return LocaleKeys.registerCode_socialAgencyCannotEmpty.tr;
        }
        return null;
      },
    );
  }

  // Nơi nhận tỉnh
  Widget _buildSelectProvinceReceive() {
    return UtilWidget.buildCardBottomSheetSelect2(
      label: LocaleKeys.registerCode_provinceReceive.tr,
      funcSelect: (didChange) {
        Get.bottomSheet(
          BottomSheetSearch<ProvinceModel>(
            title: LocaleKeys.unitInfo_selectProvince.tr,
            maxLength: 20,
            listFilter: AppData.instance.provinces.toList(),
            selectedItem: controller.provinceReceive.value,
            display: (value) => value.name,
            onAccept: (value) {
              if (value == null) return;
              controller.changeProvinceReceive(value);
              didChange(value);
            },
          ),
          isScrollControlled: true,
        );
      },
      selectedItem: controller.provinceReceive.value,
      display: (item) => item.name,
      validator: (value) {
        if (controller.provinceReceive.value == null) {
          return LocaleKeys.registerCode_provinceReceiveCannotEmpty.tr;
        }
        return null;
      },
    );
  }

  // Nơi nhận huyện
  Widget _buildSelectDistrictReceive() {
    return UtilWidget.buildCardBottomSheetSelect2(
      label: LocaleKeys.registerCode_districtReceive.tr,
      funcSelect: (didChange) async {
        final province = controller.provinceReceive.value;
        if (province == null) {
          controller
              .showSnackBar(LocaleKeys.registerCode_provinceReceiveIsEmpty.tr);
          return;
        }

        final result = await Get.bottomSheet<DistrictModel>(
          SelectDistrictBts(
            provinceCode: province.id,
            selectedDistrict: controller.districtReceive.value,
          ),
          isScrollControlled: true,
        );

        if (result != null) {
          controller.changeDistrictReceive(result);
          didChange(result);
        }
      },
      selectedItem: controller.districtReceive.value,
      display: (item) => item.name,
      validator: (value) {
        if (controller.districtReceive.value == null) {
          return LocaleKeys.registerCode_districtReceiveCannotEmpty.tr;
        }
        return null;
      },
    );
  }

  // Nơi nhận xã
  Widget _buildSelectWardReceive() {
    return UtilWidget.buildCardBottomSheetSelect2(
      label: LocaleKeys.registerCode_wardReceive.tr,
      funcSelect: (didChange) async {
        final province = controller.provinceReceive.value;
        if (province == null) {
          controller
              .showSnackBar(LocaleKeys.registerCode_provinceReceiveIsEmpty.tr);
          return;
        }

        final district = controller.districtReceive.value;
        if (district == null) {
          controller
              .showSnackBar(LocaleKeys.registerCode_districtReceiveIsEmpty.tr);
          return;
        }

        final result = await Get.bottomSheet<WardModel>(
          SelectWardBts(
            provinceCode: province.id,
            districtCode: district.id,
            selectedWard: controller.wardReceive.value,
          ),
          isScrollControlled: true,
        );

        if (result != null) {
          controller.changeWardReceive(result);
          didChange(result);
        }
      },
      selectedItem: controller.wardReceive.value,
      display: (ward) => ward.name,
      validator: (value) {
        if (controller.wardReceive.value == null) {
          return LocaleKeys.registerCode_wardReceiveCannotEmpty.tr;
        }
        return null;
      },
    );
  }

  // Đăng ký nhận kết quả
  CardDropdownWithLabel _buildSelectRegisterResult() {
    return CardDropdownWithLabel<RegisterReceiveResultModel>(
      labelText: LocaleKeys.registerCode_registerResult.tr,
      isRequired: true,
      items: AppData.instance.resultReceivingOptions.toList(),
      display: (result) => result.text,
      selectedItem: controller.registerResult.value,
      onChanged: (value) {
        controller.registerResult.value = value;
      },
      validator: (value) {
        if (value == null) {
          return LocaleKeys.registerCode_registerResultCannotEmpty.tr;
        }
        return null;
      },
    );
  }

  Widget _buildOtherInfoCard() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SDSBuildText(
          LocaleKeys.registerCode_otherInfo.tr,
          style: AppTextStyle.font16Bo,
        ),
        sdsSBHeight12,
        // Phương thức nhận kết quả
        _buildSelectMethodResult(),
        sdsSBHeight12,

        // Phương thức đóng
        _buildSelectMethodClose(),
        sdsSBHeight12,

        // Hồ sơ kèm theo
        _buildInputUnitFileInclude(),
        sdsSBHeight12,

        // Nội dung
        _buildInputUnitContent(),
      ],
    );
  }

  // Phương thức nhận kết quả
  CardDropdownWithLabel _buildSelectMethodResult() {
    return CardDropdownWithLabel<ReceiveMethodModel>(
      labelText: LocaleKeys.registerCode_methodReceiveResult.tr,
      isRequired: true,
      items: AppData.instance.receiveMethod.toList(),
      display: (result) => result.text,
      selectedItem: controller.resultReceiveMethod.value,
      onChanged: (value) {
        controller.resultReceiveMethod.value = value;
      },
      validator: (value) {
        if (value == null) {
          return LocaleKeys.registerCode_methodReceiveResultCannotEmpty.tr;
        }
        return null;
      },
    );
  }

  // Phương thức đóng
  CardDropdownWithLabel _buildSelectMethodClose() {
    return CardDropdownWithLabel<PaymentMethodModel>(
      labelText: LocaleKeys.registerCode_methodPayment.tr,
      isRequired: true,
      items: AppData.instance.paymentMethods.toList(),
      display: (result) => result.text,
      selectedItem: controller.paymentMethod.value,
      onChanged: (value) {
        controller.paymentMethod.value = value;
      },
      validator: (value) {
        if (value == null) {
          return LocaleKeys.registerCode_methodPaymentCannotEmpty.tr;
        }
        return null;
      },
    );
  }

  // Hồ sơ kèm theo
  CardInputTextFormWithLabel _buildInputUnitFileInclude() {
    return CardInputTextFormWithLabel(
      labelText: LocaleKeys.registerCode_fileInclude.tr,
      controller: controller.fileIncludeCtrl,
      inputFormatters: InputFormatterEnum.textNormal,
      isRequired: true,
      maxLengthInputForm: 500,
      validator: (value) {
        final trimmedValue = value?.trim();
        if (trimmedValue == null || trimmedValue.isEmpty) {
          return LocaleKeys.registerCode_fileIncludeCannotEmpty.tr;
        }
        return null;
      },
    );
  }

  // Nội dung
  CardInputTextFormWithLabel _buildInputUnitContent() {
    return CardInputTextFormWithLabel(
      labelText: LocaleKeys.registerCode_content.tr,
      controller: controller.contentCtrl,
      inputFormatters: InputFormatterEnum.textNormal,
      isRequired: true,
      maxLengthInputForm: 500,
      validator: (value) {
        final trimmedValue = value?.trim();
        if (trimmedValue == null || trimmedValue.isEmpty) {
          return LocaleKeys.registerCode_contentCannotEmpty.tr;
        }
        return null;
      },
    );
  }

  Widget _buildInputUsernameMySign() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: CardInputTextFormWithLabel(
            labelText: LocaleKeys.registerService_signature.tr,
            isRequired: true,
            controller: controller.usernameMySignCtrl,
            inputFormatters: InputFormatterEnum.textNormal,
            autovalidateMode: AutovalidateMode.always,
            hintText: LocaleKeys.registerService_inputCCCDregisterMySign.tr,
            onChanged: (value) {
              controller.updateStateBtnSearchCert();
            },
            validator: (value) {
              final trimmedValue = value?.trim();
              if (trimmedValue.isNullOrEmpty) {
                return LocaleKeys
                    .registerService_inputCCCDregisterMySignCannotEmpty.tr;
              }
              return null;
            },
          ),
        ),
        sdsSBWidth12,
        _buildButtonGetListCert(),
      ],
    );
  }

  Widget _buildButtonGetListCert() {
    final isEnableBtn = controller.isEnableBtnSearchCert.value;
    return SizedBox(
      width: 50,
      height: 50,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppDimens.radius12),
          ),
          padding: EdgeInsets.zero,
        ),
        onPressed: isEnableBtn
            ? () {
                controller.getListCertificate();
              }
            : null,
        child: Center(
          child: SDSImageSvg(Assets.ASSETS_ICONS_IC_LOOKUP_MY_SIGN_SVG),
        ),
      ),
    );
  }

  // Tệp đính kèm
  Widget _buildSelectUploadFile() {
    return DottedBorder(
      color: AppColors.colorBorder,
      strokeWidth: 2,
      dashPattern: [4, 4],
      borderType: BorderType.RRect,
      radius: const Radius.circular(16),
      child: InkWell(
        onTap: _showBottomSheetUploadOptions,
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: AppColors.basicWhite,
            borderRadius: BorderRadius.circular(16),
          ),
          padding: const EdgeInsets.symmetric(vertical: AppDimens.padding24),
          child: Center(
            child: Column(
              children: [
                SDSImageSvg(Assets.ASSETS_ICONS_IC_UP_FILE_SVG),
                SDSBuildText(
                  LocaleKeys.registerCode_downloadAttachment.tr,
                  style: AppTextStyle.font14Re
                      .copyWith(color: AppColors.primaryColor),
                ),
                SDSBuildText(
                  LocaleKeys.registerCode_contentDownloadAttachment.tr,
                  style: AppTextStyle.font14Re
                      .copyWith(color: AppColors.textColorGrey),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _showBottomSheetUploadOptions() {
    Get.bottomSheet(
      UtilWidget.buildBottomSheetFigma(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildUploadOption(
              icon: Icons.camera_alt_outlined,
              text: LocaleKeys.registerCode_imageFromCamera.tr,
              onTap: controller.takePhoto,
            ),
            const Divider(height: 1),
            _buildUploadOption(
              icon: Icons.image_outlined,
              text: LocaleKeys.registerCode_imageFromLibrary.tr,
              onTap: controller.pickImage,
            ),
            UtilWidget.sizedBox16,
          ],
        ),
      ),
    );
  }

  Widget _buildUploadOption({
    required IconData icon,
    required String text,
    required VoidCallback onTap,
  }) {
    return Material(
      color: Colors.white,
      child: InkWell(
        onTap: () {
          Get.back();
          onTap();
        },
        child: Row(
          children: [
            Icon(icon),
            UtilWidget.sizedBoxWidth8,
            Expanded(
              child: SDSBuildText(
                text,
                style: AppTextStyle.font16Semi,
              ),
            ),
          ],
        ).paddingSymmetric(vertical: AppDimens.defaultPadding),
      ),
    );
  }

  Widget _buildCardSignatureInfo() {
    return Obx(
      () {
        final cert = controller.certificate.value;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            sdsSBHeight12,
            _buildDropdownSerial(),
            sdsSBHeight12,
            // "Ngày bắt đầu" và "Ngày kết thúc"
            _buildDoubleItem(
              titleLeft: LocaleKeys.registerService_dayStart.tr,
              contenTitleLeft: cert?.validFrom ?? '',
              titleRight: LocaleKeys.registerService_dayEnd.tr,
              contenTitleRight: cert?.validTo ?? '',
            ),
          ],
        );
      },
    );
  }

  Widget _buildDoubleItem({
    required String titleLeft,
    required String titleRight,
    String? contenTitleLeft,
    String? contenTitleRight,
  }) {
    return Row(
      children: [
        Expanded(
          child: _buildCardItem(
            title: titleLeft,
            contenTitle: contenTitleLeft ?? '',
          ),
        ),
        sdsSBWidth12,
        Expanded(
          child: _buildCardItem(
            title: titleRight,
            contenTitle: contenTitleRight ?? '',
          ),
        ),
      ],
    );
  }

  Widget _buildCardItem({
    required String title,
    String? contenTitle,
  }) {
    return UtilWidget.buildCardBase(
      backgroundColor: AppColors.dsGray6,
      Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppDimens.paddingSmall,
          vertical: AppDimens.paddingVerySmall,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SDSBuildText(
              title,
              style: AppTextStyle.font12Re.copyWith(
                color: AppColors.dsGray3,
              ),
            ),
            sdsSBHeight4,
            SDSBuildText(
              maxLines: 5,
              contenTitle ?? '',
              style: AppTextStyle.font14Re,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buidHideImage() {
    return Obx(
      () {
        if (controller.listImage.isEmpty) {
          return const SizedBox.shrink();
        }
        return Padding(
          padding: const EdgeInsets.only(top: AppDimens.paddingSmall),
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.basicWhite,
              borderRadius: BorderRadius.circular(AppDimens.radius10),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: List.generate(
                controller.listImage.length,
                (index) {
                  final imageAttach = controller.listImage[index];
                  return Row(
                    children: [
                      Image.file(
                        File(imageAttach),
                        height: 60,
                        width: 60,
                        fit: BoxFit.cover,
                      ),
                      sdsSBWidth8,
                      Expanded(
                        child: SDSBuildText(
                          controller.getFileName(imageAttach),
                          maxLines: 2,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          controller.deleteImage(index);
                        },
                        icon: SDSImageSvg(
                          Assets.ASSETS_ICONS_IC_REMOVE_SVG,
                          color: AppColors.colorBlack,
                          width: AppDimens.sizeIconMedium,
                          height: AppDimens.sizeIconMedium,
                        ),
                      ),
                    ],
                  ).paddingSymmetric(vertical: AppDimens.paddingSmall);
                },
              ),
            ).paddingSymmetric(horizontal: AppDimens.paddingSmall),
          ),
        );
      },
    );
  }

  Widget _buildDoubleButton() {
    return KeyboardVisibilityBuilder(
      builder: (p0, isKeyboardVisible) {
        if (isKeyboardVisible) {
          return const SizedBox.shrink();
        }
        return Row(
          children: [
            Expanded(
              child: UtilWidget.buildSolidButton(
                title: LocaleKeys.registerCode_back.tr,
                borderRadius: AppDimens.radius30,
                backgroundColor: AppColors.basicWhite,
                side: const BorderSide(
                  width: 1,
                  color: AppColors.colorBlack,
                ),
                textStyle:
                    AppTextStyle.font14Re.copyWith(color: AppColors.colorBlack),
                onPressed: () {
                  controller.onTabChanged(RegisterCodeTabEnum.common_info);
                },
              ),
            ),
            sdsSBWidth12,
            Expanded(
              child: UtilWidget.buildSolidButton(
                title: LocaleKeys.registerCode_register.tr,
                borderRadius: AppDimens.radius30,
                textStyle:
                    AppTextStyle.font14Re.copyWith(color: AppColors.basicWhite),
                onPressed: () {
                  controller.registerCodeFirst();
                },
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildDropdownSerial() {
    return CardDropdownWithLabel<CertificateModel>(
      isRequired: true,
      labelText: LocaleKeys.registerService_serialNumber.tr,
      items: controller.listCert,
      display: (cert) => cert.serialNumber,
      selectedItem: controller.certificate.value,
      onChanged: (value) {
        controller.certificate.value = value;
      },
    );
  }
}
