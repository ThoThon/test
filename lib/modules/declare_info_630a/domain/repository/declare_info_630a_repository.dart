import 'package:v_bhxh/clean/core/domain/repository/base_repository_cl.dart';

import '../entity/declare_info_630a.dart';

abstract class DeclareInfo630aRepository extends BaseRepositoryCl {
  Future<bool> addProcedure630a({
    required DeclareInfo630a request,
  });

  Future<DeclareInfo630a> getDetail630a({
    required String id,
  });

  Future<bool> update630a({
    required DeclareInfo630a request,
  });
}
