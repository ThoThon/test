import 'package:v_bhxh/clean/shared/entity/entity_src.dart';
import 'package:v_bhxh/clean/core/domain/repository/base_repository_cl.dart';

abstract class DistrictRepository extends BaseRepositoryCl {
  Future<List<District>> getDistricts({
    required String provinceCode,
  });
}
