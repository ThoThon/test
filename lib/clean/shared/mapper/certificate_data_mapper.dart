import 'package:v_bhxh/clean/shared/mapper/mapper_src.dart';

import '../../../modules/register_code/data/model/certificate_data.dart';
import '../../../modules/register_code/domain/entity/certificate.dart';

class CertificateDataMapper
    extends BaseDataMapper<CertificateData, Certificate> {
  @override
  Certificate mapToEntity(CertificateData? data) {
    return Certificate(
      stt: data?.stt ?? 0,
      serialNumber: data?.serialNumber ?? '',
      name: data?.name ?? '',
      validFrom: data?.validFrom ?? '',
      validTo: data?.validTo ?? '',
      cerdentialID: data?.cerdentialID ?? '',
      userId: data?.userId ?? '',
    );
  }
}
