import 'package:v_bhxh/clean/core/domain/repository/base_repository_cl.dart';

import '../entity/declare_info_630c.dart';

abstract class DeclareInfo630cRepository extends BaseRepositoryCl {
  Future<bool> addProcedure630c({
    required DeclareInfo630c request,
  });

  Future<DeclareInfo630c> getDetail630c({
    required String id,
  });

  Future<bool> update630c({
    required DeclareInfo630c request,
  });
}
