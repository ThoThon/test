import 'package:v_bhxh/clean/shared/mapper/mapper_src.dart';
import 'package:v_bhxh/modules/register_code/clean/data/model/social_agency_data.dart';
import 'package:v_bhxh/modules/register_code/clean/domain/entity/social_agency.dart';

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
