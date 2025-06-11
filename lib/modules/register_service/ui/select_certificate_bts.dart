import 'package:v_bhxh/modules/register_service/model/certificate_model.dart';
import 'package:v_bhxh/modules/src.dart';

class SelectCertificateBts extends StatelessWidget {
  const SelectCertificateBts({
    required this.listCert,
    super.key,
  });

  final List<CertificateModel> listCert;

  @override
  Widget build(BuildContext context) {
    return UtilWidget.baseBottomSheet(
      title: LocaleKeys.registerService_listCertificate.tr,
      body: SDSSafearea(
        child: ListView.separated(
          padding: const EdgeInsets.only(top: AppDimens.defaultPadding),
          itemBuilder: (context, index) {
            final cert = listCert[index];
            return _buildCertItem(
              name: cert.name,
              fromDate: cert.validFrom,
              toDate: cert.validTo,
              cert: cert,
            );
          },
          separatorBuilder: (context, index) =>
              UtilWidget.buildDividerDefault(),
          itemCount: listCert.length,
        ),
      ),
    );
  }

  Widget _buildCertItem({
    required String name,
    required String fromDate,
    required String toDate,
    required CertificateModel cert,
  }) {
    return InkWell(
      onTap: () {
        Get.back(result: cert);
      },
      child: Row(
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: AppDimens.paddingSmall),
            child: Icon(Icons.description_outlined),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SDSBuildText(
                  name,
                  maxLines: 2,
                  overflow: TextOverflow.visible,
                ),
                sdsSBHeight4,
                SDSBuildText(
                  "${LocaleKeys.registerService_durationDate.tr}: $fromDate - $toDate",
                  style: AppTextStyle.font12Re
                      .copyWith(fontStyle: FontStyle.italic),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
