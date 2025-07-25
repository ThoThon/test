import 'package:dio/dio.dart';
import 'package:v_bhxh/clean/core/data/data_source/network/dio_builder.dart';
import 'package:v_bhxh/clean/core/data/data_source/network/network_src.dart';
import 'package:v_bhxh/clean/shared/config/env_config.dart';

class NonAuthAppServerApiClient extends RestApiClient {
  NonAuthAppServerApiClient(
    EnvConfig envConfig,
    HeaderInterceptor headerInterceptor,
  ) : super(
          dio: DioBuilder.createDio(
            options: BaseOptions(baseUrl: envConfig.baseUrl),
            interceptors: [
              headerInterceptor,
            ],
          ),
        );
}
