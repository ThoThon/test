import 'package:envied/envied.dart';

part 'env_uat.g.dart';

@Envied(path: 'lib/env/.env.uat')
abstract class EnvUat {
  @EnviedField(varName: 'BASE_URL', obfuscate: false)
  static const String baseUrl = _EnvUat.baseUrl;
}
