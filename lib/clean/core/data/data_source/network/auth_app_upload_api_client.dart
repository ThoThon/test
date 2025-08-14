import 'package:v_bhxh/clean/core/data/data_source/network/dio_builder.dart';
import 'package:v_bhxh/clean/core/data/data_source/network/network_src.dart';
import 'package:v_bhxh/shares/base_url_helper/base_url_helper_cl.dart';
import 'package:v_bhxh/shares/package/export_package.dart';

/// Client for uploading files, không có Transfer-Encoding: chunked như AuthAppServerApiClient.
/// Vì nếu có Transfer-Encoding: chunked sẽ lỗi khi upload file
class AuthAppUploadApiClient extends RestApiClient {
  AuthAppUploadApiClient(
    BaseUrlHelperCl baseUrlHelper,
    HeaderUploadInterceptor headerUploadInterceptor,
    AccessTokenInterceptor accessTokenInterceptor,
  ) : super(
          dio: DioBuilder.createDio(
            options: BaseOptions(baseUrl: baseUrlHelper.baseUrl),
            interceptors: [
              headerUploadInterceptor,
              accessTokenInterceptor,
            ],
          ),
        );
}
