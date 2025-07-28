import 'package:v_bhxh/clean/core/data/data_source/local/app_hive.dart';
import 'package:v_bhxh/clean/core/domain/usecase/base_use_case.dart';
import 'package:v_bhxh/core/values/hive_key.dart';

class SaveCompanyNameUseCase extends UseCase<String?, bool> {
  final AppHive _appHive;

  SaveCompanyNameUseCase(this._appHive);

  @override
  Future<bool> execute(String? input) async {
    final trimmedInput = input?.trim() ?? '';
    if (trimmedInput.isEmpty) {
      return false;
    }

    await _appHive.put(HiveKeys.keyCompanyName, trimmedInput);
    return true;
  }
}
