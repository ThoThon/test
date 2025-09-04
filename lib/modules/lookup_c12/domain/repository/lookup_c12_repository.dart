import 'package:v_bhxh/clean/core/domain/repository/base_repository_cl.dart';

import '../entity/lookup_c12.dart';

abstract class LookupC12Repository extends BaseRepositoryCl {
  Future<List<LookupC12>> getC12File({
    required int year,
  });
}
