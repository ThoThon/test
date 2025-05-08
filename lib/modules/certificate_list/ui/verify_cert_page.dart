import 'package:v_bhxh/modules/src.dart';

import '../controller/controller_src.dart';

class VerifyCertPageICare extends BaseGetWidget {
  VerifyCertPageICare({super.key});

  @override
  VerityCertControllerICare get controller => _controller;

  late final _controller = Get.put(VerityCertControllerICare());

  @override
  Widget buildWidgets(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(
        title: LocaleKeys.certificate_activeCert.tr,
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    final cert = controller.certInfo;
    return SDSSafearea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextUtils(
            text: cert.getCertSubject()['CN'] ?? '',
            color: AppColors.primaryColor,
            availableStyle: StyleEnum.subBold,
          ),
          sdsSBHeight12,
          UtilWidget.buildCardBase(
            Column(
              children: [
                _buildOrganization(
                  cert.getCertIssuer(),
                ),
                sdsSBHeight8,
                _buildValidFrom(cert.validFrom),
                sdsSBHeight8,
                _buildValidTo(cert.validTo),
                sdsSBHeight8,
                _buildPackageName(cert.packageName),
                sdsSBHeight8,
                _buildEmail(cert.email),
                sdsSBHeight8,
                _buildPhone(cert.phone),
              ],
            ).paddingAll(AppDimens.defaultPadding),
          ),
          sdsSBHeight12,
          _buildGradientHintCert(),
          Spacer(),
          _buildButtonConfirmActive(cert.serial ?? ''),
        ],
      ).paddingSymmetric(horizontal: AppDimens.defaultPadding),
    );
  }

  Widget _buildOrganization(String? value) {
    return UtilWidget.buildLine(
      label: LocaleKeys.certificate_organization.tr,
      value: value,
    );
  }

  Widget _buildValidFrom(String? value) {
    return UtilWidget.buildLine(
      label: LocaleKeys.certificate_validForm.tr,
      value: convertDateStringToString(value ?? '', PATTERN_1),
    );
  }

  Widget _buildValidTo(String? value) {
    return UtilWidget.buildLine(
      label: LocaleKeys.certificate_validTo.tr,
      value: convertDateStringToString(
        value ?? '',
        PATTERN_1,
      ),
    );
  }

  Widget _buildPackageName(String? value) {
    return UtilWidget.buildLine(
      label: LocaleKeys.certificate_packageName.tr,
      value: value,
    );
  }

  Widget _buildEmail(String? value) {
    return UtilWidget.buildLine(
      label: LocaleKeys.certificate_email.tr,
      value: value,
    );
  }

  Widget _buildPhone(String? value) {
    return UtilWidget.buildLine(
      label: LocaleKeys.certificate_phone.tr,
      value: value,
    );
  }

  Widget _buildGradientHintCert() {
    return UtilWidget.buildGradient(
      gradient: LinearGradient(
        colors: AppColors.primaryMain,
      ),
      child: TextUtils(
        text: LocaleKeys.certificate_certHint.tr,
        maxLine: AppConst.maxLines,
        textAlign: TextAlign.center,
        availableStyle: StyleEnum.bodyRegular,
      ),
    );
  }

  Widget _buildButtonConfirmActive(String serial) {
    return BaseButton(
      padding: EdgeInsets.only(bottom: AppDimens.defaultPadding),
      text: LocaleKeys.certificate_confirmActive.tr,
      radius: AppDimens.radius4,
      onPressed: () async {
        await controller.verifyCertSDK(serial);
      },
    );
  }
}
