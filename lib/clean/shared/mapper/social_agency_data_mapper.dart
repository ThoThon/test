import 'package:v_bhxh/clean/shared/mapper/mapper_src.dart';

import '../../../modules/register_code/data/model/social_agency_data.dart';
import '../../../modules/register_code/domain/entity/social_agency.dart';

class SocialAgencyDataMapper
    extends BaseDataMapper<SocialAgencyData, SocialAgency> {
  @override
  SocialAgency mapToEntity(SocialAgencyData? data) {
    return SocialAgency(
      maCoQuanBHXH: data?.maCoQuanBHXH ?? '',
      tenCoQuanBHXH: data?.tenCoQuanBHXH ?? '',
      maTinh: data?.maTinh ?? '',
      tenTinhThanhPho: data?.tenTinhThanhPho ?? '',
    );
  }
}
