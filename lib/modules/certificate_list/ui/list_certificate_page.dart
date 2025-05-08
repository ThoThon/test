import 'package:v_bhxh/modules/certificate_list/controller/list_certificate_controller.dart';
import 'package:v_bhxh/modules/declaration_tax_code/ui/ui_src.dart';
import 'package:v_bhxh/modules/icare/models/icare_model.src.dart';

import '../../../shares/widgets/dialog/dialog_utils.dart';

class ListCertificatePage extends BaseGetWidget {
  ListCertificatePage({super.key});

  @override
  ListCertificateControllerICare get controller => _controller;

  late final _controller = Get.put(ListCertificateControllerICare());

  @override
  Widget buildWidgets(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(
        title: TextUtils(
          text: LocaleKeys.certificate_selectCertificate.tr,
          availableStyle: StyleEnum.subBold,
        ),
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return SDSSafearea(
      child: Column(
        children: [
          Expanded(
            child: baseShowLoading(
              () => UtilWidget.buildSmartRefresher(
                onRefresh: controller.onRefresh,
                refreshController: controller.refreshController,
                child: ListView.separated(
                  itemBuilder: (context, index) {
                    final certificate = controller.listCertificate[index];
                    return _buildCardCertificate(certificate);
                  },
                  separatorBuilder: (context, index) => sdsSBHeight12,
                  itemCount: controller.listCertificate.length,
                ),
              ),
            ),
          ),
          Obx(
            () => _buildButtonConsignment(),
          ),
        ],
      ).paddingSymmetric(horizontal: AppDimens.defaultPadding),
    );
  }

  Widget _buildCardCertificate(CertIcare item) {
    return Obx(() {
      final isSelected = controller.itemSelected.value?.serial == item.serial;
      final taxCode = controller.extractTaxCodeWithRegExp(item.subject ?? '');
      final subjectName = controller.extractCNWithRegExp(item.subject ?? '');
      final fromDate = convertDateStringToString(item.validFrom!, PATTERN_1);
      final toDate = convertDateStringToString(item.validTo!, PATTERN_1);
      return InkWell(
        onTap: () {
          controller.registerItem.taxCode.replaceAll('-', '') ==
                  taxCode?.replaceAll('-', '')
              ? controller.itemSelected.value = item
              : ShowDialog.showErrorMessage(
                  LocaleKeys.certificate_taxCodeInValid.tr);
        },
        child: UtilWidget.buildCardBase(
          backgroundColor:
              isSelected ? AppColors.dsGray5 : AppColors.colorWhite,
          Padding(
            padding: const EdgeInsets.all(AppDimens.paddingSmall),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: TextUtils(
                    text: item.serial!.toUpperCase(),
                    color: AppColors.primaryColor,
                    availableStyle: StyleEnum.subBold,
                  ),
                ),
                const SizedBox(height: AppDimens.paddingSmall),
                _buildInfoRow(
                  title: LocaleKeys.certificate_declarationTaxCode.tr,
                  content: taxCode ?? '',
                ),
                _buildInfoRow(
                  title: LocaleKeys.certificate_subjectName.tr,
                  content: subjectName ?? '',
                ),
                _buildDateRow(fromDate, toDate),
                sdsSBHeight8,
                _buildStatus(item),
              ],
            ),
          ),
        ),
      );
    });
  }

  Widget _buildInfoRow({
    required String title,
    required String content,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 2,
          child: TextUtils(
            text: '$title:',
            availableStyle: StyleEnum.bodyRegular,
            maxLine: 2,
          ),
        ),
        const SizedBox(width: AppDimens.paddingVerySmall),
        Expanded(
          flex: 3,
          child: TextUtils(
            text: content,
            availableStyle: StyleEnum.bodyBold,
            maxLine: 2,
          ),
        ),
      ],
    ).paddingOnly(bottom: AppDimens.paddingVerySmall);
  }

  Widget _buildDateRow(String fromDate, String toDate) {
    return Row(
      children: [
        TextUtils(
          text: LocaleKeys.certificate_startFormDate.tr,
          availableStyle: StyleEnum.bodyRegular,
        ),
        TextUtils(
          text: "  $fromDate",
          availableStyle: StyleEnum.bodyBold,
        ),
        const SizedBox(width: AppDimens.paddingSmall),
        TextUtils(
          text: LocaleKeys.certificate_to.tr,
          availableStyle: StyleEnum.bodyRegular,
        ),
        TextUtils(
          text: "  $toDate",
          availableStyle: StyleEnum.bodyBold,
        ),
      ],
    );
  }

  Widget _buildStatus(CertIcare cert) {
    final statusColor =
        cert.isActive ? AppColors.statusGreen : AppColors.statusRed;
    return Row(
      children: [
        SDSImageSvg(
          cert.isActive
              ? Assets.ASSETS_ICONS_IC_ACTIVE_SVG
              : Assets.ASSETS_ICONS_IC_NOT_ACTIVE_SVG,
          color: statusColor,
        ),
        sdsSBWidth4,
        TextUtils(
          text: cert.isActive
              ? LocaleKeys.certificate_active
              : LocaleKeys.certificate_inActive,
          availableStyle: StyleEnum.bodyBold,
          color: statusColor,
        ),
        const Spacer(),
        Visibility(
          visible: !cert.isActive,
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: AppDimens.padding5,
            ),
            decoration: BoxDecoration(
              color: AppColors.secondaryOrange1,
              borderRadius: BorderRadius.circular(AppDimens.radius4),
            ),
            child: TextUtils(
              text: LocaleKeys.certificate_activeNow,
              textAlign: TextAlign.end,
              availableStyle: StyleEnum.bodyBold,
              color: AppColors.colorWhite,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildButtonConsignment() {
    final selectedItem = controller.itemSelected.value;
    final isButtonEnabled = selectedItem != null;
    final isActive = selectedItem?.isActive ?? true;

    return BaseButton(
      padding: const EdgeInsets.symmetric(vertical: AppDimens.defaultPadding),
      width: double.infinity,
      text: isActive
          ? LocaleKeys.certificate_confirm.tr
          : LocaleKeys.certificate_activeCert.tr,
      radius: AppDimens.radius4,
      onPressed: isButtonEnabled
          ? () {
              isActive
                  ? controller.goToAwaitConfirmSignPage(selectedItem.serial!)
                  : controller.goToVerifyCertPage(selectedItem.serial!);
            }
          : null,
    );
  }
}
