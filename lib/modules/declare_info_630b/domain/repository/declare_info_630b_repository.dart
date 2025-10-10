import 'package:v_bhxh/clean/core/domain/repository/base_repository_cl.dart';

import '../entity/declare_info_630b.dart';

abstract class DeclareInfo630bRepository extends BaseRepositoryCl {
  Future<bool> addProcedure630b({
    required DeclareInfo630b request,
  });

  Future<DeclareInfo630b> getDetail630b({
    required String id,
  });

  Future<bool> update630b({
    required DeclareInfo630b request,
  });
}
