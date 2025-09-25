import 'package:v_bhxh/clean/core/domain/repository/base_repository_cl.dart';
import 'package:v_bhxh/clean/features/login/domain/entity/login_request.dart';
import 'package:v_bhxh/clean/shared/entity/categories_630/categories_630.dart';
import 'package:v_bhxh/clean/shared/entity/entity_src.dart';

abstract class LoginRepository extends BaseRepositoryCl {
  Future<String?> login({
    required LoginRequest request,
  });

  Future<AccountInfo> getAccountInfo();

  Future<D02Categories> getD02Categories();

  Future<Categories630> get630Categories();
}
