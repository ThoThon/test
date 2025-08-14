import 'package:dio/dio.dart';
import 'package:v_bhxh/clean/core/data/data_source/network/dio_builder.dart';
import 'package:v_bhxh/clean/core/data/data_source/network/network_src.dart';
import 'package:v_bhxh/shares/base_url_helper/base_url_helper_cl.dart';

class NonAuthAppServerApiClient extends RestApiClient {
  NonAuthAppServerApiClient(
    BaseUrlHelperCl baseUrlHelper,
    HeaderInterceptor headerInterceptor,
  ) : super(
          dio: DioBuilder.createDio(
            options: BaseOptions(baseUrl: baseUrlHelper.baseUrl),
            interceptors: [
              headerInterceptor,
            ],
          ),
        );
}
