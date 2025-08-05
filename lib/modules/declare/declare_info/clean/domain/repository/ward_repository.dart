import 'package:v_bhxh/clean/core/domain/entity/entity_src.dart';
import 'package:v_bhxh/clean/core/domain/repository/base_repository_cl.dart';

abstract class WardRepository extends BaseRepositoryCl {
  Future<List<Ward>> getWards({
    required String provinceCode,
    required String districtCode,
  });
}
