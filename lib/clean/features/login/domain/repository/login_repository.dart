import 'package:v_bhxh/clean/shared/entity/account_info.dart';
import 'package:v_bhxh/clean/shared/entity/d02_categories_cl.dart';
import 'package:v_bhxh/clean/core/domain/repository/base_repository_cl.dart';
import 'package:v_bhxh/clean/features/login/domain/entity/login_request.dart';

abstract class LoginRepository extends BaseRepositoryCl {
  Future<String?> login({
    required LoginRequest request,
  });

  Future<AccountInfo> getAccountInfo();

  Future<D02CategoriesCl> getD02Categories();

  Future<int> getUnreadNotificationCount();
}
