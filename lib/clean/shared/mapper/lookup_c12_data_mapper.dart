import 'package:v_bhxh/clean/shared/mapper/mapper_src.dart';

import '../../../modules/lookup_c12/data/model/lookup_c12_data.dart';
import '../../../modules/lookup_c12/domain/entity/lookup_c12.dart';

class LookupC12DataMapper extends BaseDataMapper<LookupC12Data, LookupC12> {
  @override
  LookupC12 mapToEntity(LookupC12Data? data) {
    return LookupC12(
      year: data?.year ?? DateTime.now().year,
      month: data?.month ?? DateTime.now().month,
      c12FilePath: data?.c12FilePath ?? '',
    );
  }
}
