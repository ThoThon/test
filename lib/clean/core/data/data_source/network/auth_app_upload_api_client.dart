import 'package:v_bhxh/clean/core/data/data_source/network/dio_builder.dart';
import 'package:v_bhxh/clean/core/data/data_source/network/network_src.dart';
import 'package:v_bhxh/clean/shared/config/env_config.dart';
import 'package:v_bhxh/shares/package/export_package.dart';

/// Client for uploading files, không có Transfer-Encoding: chunked như AuthAppServerApiClient.
/// Vì nếu có Transfer-Encoding: chunked sẽ lỗi khi upload file
class AuthAppUploadApiClient extends RestApiClient {
  AuthAppUploadApiClient(
    EnvConfig envConfig,
    HeaderUploadInterceptor headerUploadInterceptor,
    AccessTokenInterceptor accessTokenInterceptor,
  ) : super(
          dio: DioBuilder.createDio(
            options: BaseOptions(baseUrl: envConfig.baseUrl),
            interceptors: [
              headerUploadInterceptor,
              accessTokenInterceptor,
            ],
          ),
        );
}
