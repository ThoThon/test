part of 'register_code_page.dart';

extension RegisterInfoTab on RegisterCodePage {
  Widget _buildRegisterInfoTab() {
    return Form(
      key: controller.formKeyRegisterTab,
      child: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  _buildBhxhInfoCard(),
                  sdsSBHeight20,
                  _buildOtherInfoCard(),
                  sdsSBHeight12,
                  // Ô input nhập username My Sign
                  _buildInputUsernameMySign(),
                  _buildCardSignatureInfo(),
                  sdsSBHeight12,
                  _buildButtonPickFile(),
                  _buidHideImage(),
                ],
              ),
            ),
          ),
        ],
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
        sdsSBHeight8,
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
    return UtilWidget.buildCardBottomSheetSelect(
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
    return UtilWidget.buildCardBottomSheetSelect(
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
    return UtilWidget.buildCardBottomSheetSelect(
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
    return UtilWidget.buildCardBottomSheetSelect(
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
      isValidate: true,
      items: AppData.instance.resultReceivingOptions.toList(),
      display: (result) => result.text,
      selectedItem: controller.registerResult.value,
      onChanged: (value) {
        controller.registerResult.value = value;
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
        sdsSBHeight8,
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
      isValidate: true,
      items: AppData.instance.receiveMethod.toList(),
      display: (result) => result.text,
      selectedItem: controller.resultReceiveMethod.value,
      onChanged: (value) {
        controller.resultReceiveMethod.value = value;
      },
    );
  }

  // Phương thức đóng
  CardDropdownWithLabel _buildSelectMethodClose() {
    return CardDropdownWithLabel<PaymentMethodModel>(
      labelText: LocaleKeys.registerCode_methodPayment.tr,
      isValidate: true,
      items: AppData.instance.paymentMethods.toList(),
      display: (result) => result.text,
      selectedItem: controller.paymentMethod.value,
      onChanged: (value) {
        controller.paymentMethod.value = value;
      },
    );
  }

  // Hồ sơ kèm theo
  CardInputTextFormWithLabel _buildInputUnitFileInclude() {
    return CardInputTextFormWithLabel(
      labelText: LocaleKeys.registerCode_fileInclude.tr,
      controller: controller.fileIncludeCtrl,
      inputFormatters: InputFormatterEnum.textNormal,
      isValidate: true,
      maxLengthInputForm: 500,
    );
  }

  // Nội dung
  CardInputTextFormWithLabel _buildInputUnitContent() {
    return CardInputTextFormWithLabel(
      labelText: LocaleKeys.registerCode_content.tr,
      controller: controller.contentCtrl,
      inputFormatters: InputFormatterEnum.textNormal,
      isValidate: true,
      maxLengthInputForm: 500,
    );
  }

  Widget _buildInputUsernameMySign() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: BuildInputText(
            InputTextModel(
              controller: controller.usernameMySignCtrl,
              autovalidateMode: AutovalidateMode.always,
              hintText: LocaleKeys.registerService_inputMySignUsername.tr,
              validator: (value) {
                if (value.isNullOrEmpty) {
                  return LocaleKeys
                      .registerService_userNameMySignCannotEmpty.tr;
                }
                return null;
              },
            ),
          ),
        ),
        sdsSBWidth8,
        _buildButtonGetListCert(),
      ],
    );
  }

  Widget _buildButtonGetListCert() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppDimens.radius12),
            ),
            padding: const EdgeInsets.symmetric(
              horizontal: AppDimens.defaultPadding,
            ),
          ),
          onPressed: () {
            controller.getListCertificate();
          },
          child: const Icon(
            Icons.send,
            color: AppColors.basicWhite,
          ),
        ),
      ],
    );
  }

  // Tệp đính kèm
  Widget _buildButtonPickFile() {
    return Row(
      children: [
        UtilWidget.buildSolidButton(
          title: LocaleKeys.registerCode_attachment.tr,
          borderRadius: AppDimens.radius8,
          textStyle:
              AppTextStyle.font14Re.copyWith(color: AppColors.basicWhite),
          onPressed: () {
            Get.bottomSheet(
              UtilWidget.buildBottomSheetFigma(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Material(
                      color: Colors.white,
                      child: InkWell(
                        onTap: () {
                          // Close the bottom sheet
                          Get.back();
                          controller.takePhoto();
                        },
                        child: Row(
                          children: [
                            const Icon(Icons.camera_alt_outlined),
                            UtilWidget.sizedBoxWidth8,
                            Expanded(
                              child: SDSBuildText(
                                LocaleKeys.registerCode_imageFromCamera.tr,
                                style: AppTextStyle.font16Semi,
                              ),
                            ),
                          ],
                        ).paddingSymmetric(
                          vertical: AppDimens.defaultPadding,
                        ),
                      ),
                    ),
                    const Divider(height: 1),
                    Material(
                      color: Colors.white,
                      child: InkWell(
                        onTap: () {
                          // Close the bottom sheet
                          Get.back();
                          controller.pickImage();
                        },
                        child: Row(
                          children: [
                            const Icon(Icons.image_outlined),
                            UtilWidget.sizedBoxWidth8,
                            Expanded(
                              child: SDSBuildText(
                                LocaleKeys.registerCode_imageFromLibrary.tr,
                                style: AppTextStyle.font16Semi,
                              ),
                            ),
                          ],
                        ).paddingSymmetric(vertical: AppDimens.defaultPadding),
                      ),
                    ),
                    UtilWidget.sizedBox16,
                  ],
                ),
              ),
            );
          },
        ),
        sdsSBWidth8,
        Expanded(
          child: SDSBuildText(
            LocaleKeys.registerCode_format.tr,
            style: AppTextStyle.font14Re.copyWith(
              color: AppColors.dsGray2,
              fontStyle: FontStyle.italic,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildCardSignatureInfo() {
    return Obx(
      () {
        final cert = controller.certificate.value;
        return Visibility(
          visible: cert != null,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              sdsSBHeight12,
              // Tên chủ thể CTS
              _buildSingleItem(
                title: LocaleKeys.registerService_subjectNameCert.tr,
                contenTitle: cert?.name ?? '',
              ),
              sdsSBHeight12,

              // Tên tổ chức trực thuộc CTS
              _buildSingleItem(
                  title: LocaleKeys.registerService_organizationNameOfCert.tr,
                  // TODO: Phía BE chưa có thuộc tính này, tạm thời fix cứng
                  contenTitle: cert == null ? '' : "Viettel - CA RS"),
              sdsSBHeight12,

              // Số CTS
              _buildSingleItem(
                title: LocaleKeys.registerService_certificateNumber.tr,
                contenTitle: cert?.serialNumber ?? '',
              ),
              sdsSBHeight12,

              // "Thời hạn sử dụng từ" và "Thời hạn sử dụng đến"
              _buildDoubleItem(
                titleLeft: LocaleKeys.registerService_expiryDateFrom.tr,
                contenTitleLeft: cert?.validFrom ?? '',
                titleRight: LocaleKeys.registerService_expiryDateTo.tr,
                contenTitleRight: cert?.validTo ?? '',
              ),
            ],
          ),
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

  Widget _buildSingleItem({
    required String title,
    String? contenTitle,
  }) {
    return Row(
      children: [
        Expanded(
          child: _buildCardItem(
            title: title,
            contenTitle: contenTitle ?? '',
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
        return Container(
          decoration: BoxDecoration(
            border: Border.all(
              width: 1,
              color: AppColors.dsGray5,
            ),
            borderRadius: BorderRadius.circular(AppDimens.radius8),
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
                      height: 80,
                      width: 80,
                      fit: BoxFit.cover,
                    ),
                    sdsSBWidth8,
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SDSBuildText(
                            controller.getFileName(imageAttach),
                            maxLines: 2,
                          ),
                        ],
                      ),
                    ),
                    const Spacer(),
                    IconButton(
                      onPressed: () {
                        controller.deleteImage(index);
                      },
                      icon: SDSImageSvg(
                        Assets.ASSETS_ICONS_IC_REMOVE_SVG,
                        width: AppDimens.sizeIconMedium,
                        height: AppDimens.sizeIconMedium,
                      ),
                    ),
                  ],
                ).paddingSymmetric(vertical: AppDimens.paddingSmall);
              },
            ),
          ).paddingSymmetric(horizontal: AppDimens.paddingSmall),
        ).paddingOnly(
          top: AppDimens.paddingVerySmall,
        );
      },
    );
  }
}
