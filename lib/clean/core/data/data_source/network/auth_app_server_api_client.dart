import 'package:dio/dio.dart';
import 'package:v_bhxh/clean/core/data/data_source/network/dio_builder.dart';
import 'package:v_bhxh/clean/core/data/data_source/network/network_src.dart';
import 'package:v_bhxh/clean/shared/config/env_config.dart';

class AuthAppServerApiClient extends RestApiClient {
  AuthAppServerApiClient(
    EnvConfig envConfig,
    HeaderInterceptor headerInterceptor,
    AccessTokenInterceptor accessTokenInterceptor,
  ) : super(
          dio: DioBuilder.createDio(
            options: BaseOptions(baseUrl: envConfig.baseUrl),
            interceptors: [
              headerInterceptor,
              accessTokenInterceptor,
            ],
          ),
        );
}
