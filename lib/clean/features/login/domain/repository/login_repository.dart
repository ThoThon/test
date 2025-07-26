import 'package:v_bhxh/clean/core/data/model/model_src.dart';
import 'package:v_bhxh/clean/core/domain/entity/account_info.dart';
import 'package:v_bhxh/clean/core/domain/repository/base_repository_cl.dart';
import 'package:v_bhxh/clean/features/login/domain/entity/login_request.dart';

abstract class LoginRepository extends BaseRepositoryCl {
  Future<BaseResponseCl<String>> login({
    required LoginRequest request,
  });

  Future<AccountInfo> getAccountInfo();
}
