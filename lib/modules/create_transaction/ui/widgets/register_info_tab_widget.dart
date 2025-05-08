part of '../register_info_tab_page.dart';

extension RegisterInfoTabWidget on RegisterInfoTabPage {
  Widget _buildBody() {
    return Form(
      key: controller.formKeyTabRegister,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSocialInfoCard(),
          _buildAddressInfCard(),
          Obx(
            () {
              return controller.isContentInfoEdit.value
                  ? _buildContentInfoCard()
                  : _buildContentInfoCardEdit();
            },
          ),
          _buildCardAddImage(),
        ],
      ),
    );
  }

  Widget _buildSocialInfoCard() {
    return UtilWidget.buildCardBase(
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextUtils(
            text: LocaleKeys.transaction_socialInfo.tr,
            availableStyle: StyleEnum.bodyBold,
          ).paddingOnly(bottom: AppDimens.paddingSmall),
          Visibility(
            visible: controller.itemInfoCompany.unitCode.isNotEmpty,
            child: _buildBottomSheetProvinceReceive(),
          ),
          _buildBottomSheetSocialAgency(),
        ],
      ).paddingAll(AppDimens.paddingSmall),
    ).paddingOnly(
      bottom: AppDimens.defaultPadding,
    );
  }

  Widget _buildBottomSheetSocialAgency() {
    return _buildBottomSheetSelect<SocialAgencyResponse>(
      label: LocaleKeys.transaction_socialAgency.tr,
      hintText: LocaleKeys.transaction_selectSocialAgency.tr,
      funcSelect: () {
        Get.bottomSheet(
          _buildSocialAgencyChildBtnSheet(),
          isScrollControlled: true,
        );
      },
      item: controller.selectedSocialAgency,
      display: (value) => value.socialAgencyName,
      validator: (p0) {
        if (controller.selectedSocialAgency.value == null) {
          return "${LocaleKeys.transaction_socialAgency.tr} ${LocaleKeys.input_inputEmpty.tr}";
        }
        return null;
      },
    );
  }

  Widget _buildSocialAgencyChildBtnSheet() {
    return BottomSheetSearch<SocialAgencyResponse>(
      title: LocaleKeys.transaction_selectSocialAgency.tr,
      listFilter: controller.listSocialAgency,
      itemSelect: controller.selectedSocialAgency.value.obs,
      display: (value) => value.socialAgencyName,
      onAccept: (p0) {
        controller.selectedSocialAgency.value = p0;
      },
    );
  }

  Widget _buildProvinceChildBtnSheet() {
    return BottomSheetSearch<ProvinceResponse>(
      title: LocaleKeys.transaction_selectProvince.tr,
      listFilter: controller.listProvince,
      itemSelect: controller.selectedProvince.value.obs,
      display: (value) => value.provinceName,
      onAccept: (p0) {
        if (p0 == null) return;
        controller.selectedProvince.value = p0;
        if (controller.itemInfoCompany.unitCode.isNotEmpty) {
          controller.fetchListSocialAgency();
        } else {
          controller.fetchListDistrict(p0.provinceCode);
        }
      },
    );
  }

  Widget _buildDistrictResponseChildBtnSheet() {
    return BottomSheetSearch<DistrictResponse>(
      title: LocaleKeys.transaction_selectDistrict.tr,
      listFilter: controller.listDistrict,
      itemSelect: controller.selectedDistrict.value.obs,
      display: (value) => value.districtName,
      onAccept: (p0) {
        if (p0 == null) return;
        controller.selectedDistrict.value = p0;
        controller.fetchListWard(
          p0.provinceCode,
          p0.districtCode,
        );
      },
    );
  }

  Widget _buildWardResponseChildBtnSheet() {
    return BottomSheetSearch<WardResponse>(
      title: LocaleKeys.transaction_selectWard.tr,
      listFilter: controller.listWard,
      itemSelect: controller.selectedWard.value.obs,
      display: (value) => value.wardName,
      onAccept: (p0) {
        if (p0 == null) return;
        controller.selectedWard.value = p0;
      },
    );
  }

  Widget _buildAddressInfCard() {
    return Visibility(
      visible: controller.itemInfoCompany.unitCode.isEmpty,
      child: UtilWidget.buildCardBase(
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextUtils(
              text: LocaleKeys.transaction_addressInfo.tr,
              availableStyle: StyleEnum.bodyBold,
            ).paddingOnly(bottom: AppDimens.paddingSmall),
            _buildBottomSheetProvinceReceive(),
            _buildBottomSheetDistrictsReceive(),
            _buildBottomSheetWardReceive(),
          ],
        ).paddingAll(AppDimens.paddingSmall),
      ).paddingOnly(bottom: AppDimens.defaultPadding),
    );
  }

  Widget _buildContentInfoCardEdit() {
    return UtilWidget.buildCardBase(
      Column(
        children: [
          _buildTitleAndIcon(
            isEdit: controller.isContentInfoEdit,
            title: LocaleKeys.transaction_content.tr,
            onTap: () {
              controller.isContentInfoEdit.toggle();
            },
          ),
          _buildInputItem(
            controller: controller.representativeController,
            label: LocaleKeys.transaction_trader.tr,
          ),
          _buildInputItem(
            controller: controller.phoneContactController,
            label: LocaleKeys.transaction_phoneContact.tr,
            inputFormatters: InputFormatterEnum.phoneNumber,
            maxLengthInputForm: 20,
          ),
          _buildInputItem(
            controller: controller.emailContactController,
            label: LocaleKeys.transaction_email.tr,
            inputFormatters: InputFormatterEnum.email,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return LocaleKeys.transaction_emailIsNotEmpty.tr;
              }
              if (!isEmail(value)) {
                return LocaleKeys.transaction_emailInValid.tr;
              }
              return null;
            },
          ),
          Visibility(
            visible: controller.itemInfoCompany.unitCode.isEmpty,
            child: Column(
              children: [
                _buildInputItem(
                  controller: controller.fileIncludeController,
                  label: LocaleKeys.transaction_fileInclude.tr,
                  isRequired: false,
                ),
              ],
            ),
          )
        ],
      ).paddingSymmetric(horizontal: AppDimens.paddingSmall),
    );
  }

  Widget _buildContentInfoCard() {
    return UtilWidget.buildCardBase(
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildTitleAndIcon(
            isEdit: controller.isContentInfoEdit,
            title: LocaleKeys.transaction_content.tr,
            onTap: () {
              controller.isContentInfoEdit.toggle();
            },
          ),
          _buildText(
              "${LocaleKeys.transaction_trader.tr}: ${controller.representativeController.text}"),
          _buildText(
              "${LocaleKeys.transaction_phoneContact.tr}: ${controller.phoneContactController.text}"),
          _buildText(
              "${LocaleKeys.transaction_email.tr}: ${controller.emailContactController.text}"),
          Visibility(
            visible: controller.itemInfoCompany.unitCode.isEmpty,
            child: _buildText(
                "${LocaleKeys.transaction_fileInclude.tr}: ${controller.fileIncludeController.text}"),
          ),
        ],
      ).paddingSymmetric(horizontal: AppDimens.paddingSmall),
    );
  }

  Widget _buildCardAddImage() {
    return Visibility(
      visible: controller.itemInfoCompany.unitCode.isEmpty,
      child: UtilWidget.buildCardBase(
        Column(
          children: [
            _buildButtonAddImage(),
            _buidHideImage(),
          ],
        ).paddingAll(AppDimens.paddingSmall),
      ).paddingOnly(top: AppDimens.defaultPadding),
    );
  }

  Widget _buildButtonAddImage() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            TextUtils(
              text: LocaleKeys.transaction_attached.tr,
              textAlign: TextAlign.left,
              availableStyle: StyleEnum.detailRegular,
            ),
            TextUtils(
              text: ' (*)',
              size: AppDimens.sizeTextSmaller,
              color: AppColors.statusRed,
            ),
          ],
        ),
        ElevatedButton(
          onPressed: () {
            Get.bottomSheet(
              UtilWidget.buildBottomSheetAddImage(
                child: Column(
                  children: [
                    _buildBottomSheetAddImage(
                      title: LocaleKeys.transaction_pickImageFromCamera.tr,
                      icon: Icons.camera_alt_outlined,
                      onTap: () {
                        controller.getImageFromCamera();
                      },
                    ),
                    Divider(
                      height: 1,
                      color: AppColors.dsGray3,
                    ),
                    _buildBottomSheetAddImage(
                      title: LocaleKeys.transaction_pickImageFromLibrary.tr,
                      icon: Icons.collections_outlined,
                      onTap: () {
                        controller.pickMultipleImages();
                      },
                    ).paddingOnly(bottom: AppDimens.paddingSmall),
                  ],
                ).paddingSymmetric(horizontal: AppDimens.paddingVerySmall),
              ),
              isScrollControlled: true,
              elevation: 0,
            );
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.buttonTab,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppDimens.radius4),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SDSImageSvg(
                Assets.ASSETS_ICONS_IC_ADD_IMAGE_SVG,
                width: AppDimens.sizeIconMedium,
                height: AppDimens.sizeIconMedium,
              ),
              sdsSBWidth8,
              TextUtils(
                text: LocaleKeys.transaction_addImageAttached.tr,
                color: AppColors.primaryColor,
                availableStyle: StyleEnum.bodyBold,
              ),
            ],
          ),
        ),
        Obx(
          () {
            return Visibility(
              visible: controller.listImage.isEmpty,
              child: TextUtils(
                text: LocaleKeys.transaction_fileIncludeInValid.tr,
                color: AppColors.statusRed,
                availableStyle: StyleEnum.detailRegular,
              ).paddingOnly(left: AppDimens.paddingVerySmall),
            );
          },
        )
      ],
    );
  }

  Widget _buildInputItem({
    required TextEditingController controller,
    required String label,
    int? inputFormatters,
    int? maxLengthInputForm,
    bool isRequired = true,
    FormFieldValidator<String>? validator,
  }) {
    return BuildInputTextWithLabel(
      label: label,
      textStyle: StyleEnum.detailRegular,
      buildInputText: BuildInputText(
        InputTextModel(
          validator: validator,
          controller: controller,
          inputFormatters: inputFormatters ?? 0,
          maxLengthInputForm: maxLengthInputForm,
          isShowCounterText: false,
          isValidate: isRequired,
          autovalidateMode: AutovalidateMode.always,
        ),
      ),
    ).paddingOnly(
      bottom: AppDimens.paddingSmall,
    );
  }

  Widget _buidHideImage() {
    return Obx(
      () {
        if (controller.listImage.isEmpty) {
          return SizedBox.shrink();
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
                final imageSelected = controller.listImage[index];
                return Row(
                  children: [
                    Image.file(
                      File(imageSelected.path),
                      fit: BoxFit.cover,
                    ),
                    UtilWidget.sizedBoxWidth8,
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextUtils(
                            text: imageSelected.name,
                            availableStyle: StyleEnum.bodyRegular,
                            maxLine: 2,
                          ),
                          TextUtils(
                            text: controller.getImageSize(
                              File(imageSelected.path),
                            ),
                            availableStyle: StyleEnum.detailRegular,
                          ),
                        ],
                      ),
                    ),
                    Spacer(),
                    IconButton(
                      onPressed: () {
                        controller.removeImage(index);
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

  Widget _buildBottomSheetDistrictsReceive() {
    return _buildBottomSheetSelect<DistrictResponse>(
      label: LocaleKeys.transaction_receiveDistrict.tr,
      hintText: LocaleKeys.transaction_selectDistrict.tr,
      funcSelect: () {
        Get.bottomSheet(
          _buildDistrictResponseChildBtnSheet(),
          isScrollControlled: true,
        );
      },
      item: controller.selectedDistrict,
      display: (district) => district.districtName,
      validator: (p0) {
        if (controller.selectedDistrict.value == null) {
          return "${LocaleKeys.transaction_receiveDistrict.tr} ${LocaleKeys.input_inputEmpty.tr.toLowerCase()}";
        }
        return null;
      },
    );
  }

  Widget _buildBottomSheetWardReceive() {
    return _buildBottomSheetSelect<WardResponse>(
      label: LocaleKeys.transaction_receiveWard.tr,
      hintText: LocaleKeys.transaction_selectWard.tr,
      funcSelect: () {
        Get.bottomSheet(
          _buildWardResponseChildBtnSheet(),
          isScrollControlled: true,
        );
      },
      item: controller.selectedWard,
      display: (ward) => ward.wardName,
      validator: (p0) {
        if (controller.selectedWard.value == null) {
          return "${LocaleKeys.transaction_receiveWard.tr} ${LocaleKeys.input_inputEmpty.tr.toLowerCase()}";
        }
        return null;
      },
    );
  }

  Widget _buildBottomSheetProvinceReceive() {
    return _buildBottomSheetSelect<ProvinceResponse>(
      label: LocaleKeys.transaction_receiveCity.tr,
      hintText: LocaleKeys.transaction_selectProvince.tr,
      funcSelect: () {
        Get.bottomSheet(
          _buildProvinceChildBtnSheet(),
          isScrollControlled: true,
        );
      },
      item: controller.selectedProvince,
      display: (value) => value.provinceName,
      validator: (p0) {
        if (controller.selectedProvince.value == null) {
          return "${LocaleKeys.transaction_receiveCity.tr} ${LocaleKeys.input_inputEmpty.tr.toLowerCase()}";
        }
        return null;
      },
    );
  }

  Widget _buildBottomSheetSelect<T>({
    required String label,
    required String hintText,
    required Function funcSelect,
    required Rx<T?> item,
    required String Function(T) display,
    String? Function(T?)? validator,
  }) {
    return Obx(
      () {
        return FormField(
          autovalidateMode: AutovalidateMode.always,
          validator: validator,
          initialValue: item.value,
          builder: (FormFieldState<T> state) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.only(bottom: AppDimens.paddingSmallest),
                  child: Row(
                    children: [
                      TextUtils(
                        text: label,
                        availableStyle: StyleEnum.detailRegular,
                      ),
                      TextUtils(
                        text: ' (*)',
                        size: AppDimens.sizeTextSmaller,
                        color: AppColors.statusRed,
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    KeyBoard.hide();
                    funcSelect();
                    state.didChange(item.value);
                  },
                  child: Container(
                    padding: const EdgeInsets.all(AppDimens.paddingSmall),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: state.errorText != null
                            ? AppColors.statusRed
                            : AppColors.dsGray5,
                      ),
                      borderRadius: BorderRadius.circular(AppDimens.radius4),
                    ),
                    child: Obx(
                      () => Row(
                        children: [
                          Expanded(
                            child: TextUtils(
                              text: item.value != null
                                  ? display(item.value as T)
                                  : hintText,
                              availableStyle: StyleEnum.bodyRegular,
                              color: item.value != null
                                  ? AppColors.colorBlack
                                  : Color.fromARGB(255, 2, 2, 2),
                            ),
                          ),
                          const Icon(
                            Icons.arrow_drop_down,
                            color: AppColors.dsGray3,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                if (state.hasError)
                  Padding(
                    padding: const EdgeInsets.only(
                      top: AppDimens.paddingSmallest,
                      left: AppDimens.paddingVerySmall,
                    ),
                    child: TextUtils(
                      text: state.errorText!,
                      availableStyle: StyleEnum.detailRegular,
                      color: AppColors.statusRed,
                    ),
                  ),
              ],
            ).paddingOnly(bottom: AppDimens.paddingSmall);
          },
        );
      },
    );
  }

  Widget _buildBottomSheetAddImage({
    required String title,
    required IconData icon,
    VoidCallback? onTap,
    final bool useBack = true,
  }) {
    return Column(
      children: [
        InkWell(
          onTap: () {
            if (useBack) {
              Get.back();
            }
            onTap?.call();
          },
          child: Row(
            children: [
              Icon(
                icon,
                color: AppColors.dsGray3,
              ).paddingOnly(
                right: AppDimens.defaultPadding,
              ),
              Expanded(
                child: TextUtils(
                  text: title,
                  availableStyle: StyleEnum.bodyRegular,
                  textAlign: TextAlign.start,
                ),
              ),
            ],
          ).paddingSymmetric(
            vertical: AppDimens.paddingSmall,
          ),
        ),
      ],
    );
  }

  Widget _buildTitleAndIcon({
    required String title,
    required RxBool isEdit,
    required VoidCallback onTap,
  }) {
    return Row(
      children: [
        TextUtils(
          text: title,
          availableStyle: StyleEnum.bodyBold,
        ),
        Spacer(),
        GestureDetector(
          onTap: onTap,
          child: isEdit.value
              ? SDSImageSvg(
                  Assets.ASSETS_ICONS_IC_EDIT_SVG,
                  width: AppDimens.sizeIcon,
                  height: AppDimens.sizeIcon,
                )
              : Icon(
                  Icons.check_outlined,
                  color: AppColors.primaryColor,
                ),
        ),
      ],
    ).paddingSymmetric(vertical: AppDimens.paddingSmall);
  }

  Widget _buildText(
    String text, {
    int? maxLines,
  }) {
    return TextUtils(
      text: text,
      availableStyle: StyleEnum.bodyRegular,
      maxLine: maxLines ?? 3,
    ).paddingOnly(bottom: AppDimens.paddingSmall);
  }
}
