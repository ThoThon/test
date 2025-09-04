import 'package:v_bhxh/clean/core/data/data_source/local/app_hive.dart';
import 'package:v_bhxh/clean/core/domain/usecase/base_use_case.dart';
import 'package:v_bhxh/core/values/hive_key.dart';

class GetLastUsernameUseCase extends NoInputUseCase<String?> {
  final AppHive _appHive;

  GetLastUsernameUseCase(this._appHive);

  @override
  String? execute() {
    return _appHive.get<String>(HiveKeys.keyUsername);
  }
}
