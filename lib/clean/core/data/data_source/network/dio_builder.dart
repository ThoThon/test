import 'package:dio/dio.dart';
import 'package:dio_log_sds/interceptor/dio_log_interceptor.dart';
import 'package:v_bhxh/clean/shared/constants/const.dart';
import 'package:v_bhxh/shares/log/dio_log.dart';

class DioBuilder {
  const DioBuilder._();

  static Dio createDio({
    BaseOptions? options,
    List<Interceptor> interceptors = const [],
  }) {
    final dio = Dio(
      BaseOptions(
        connectTimeout: options?.connectTimeout ?? connectTimeout,
        receiveTimeout: options?.receiveTimeout ?? receiveTimeout,
        sendTimeout: options?.sendTimeout ?? sendTimeout,
        baseUrl: options?.baseUrl ?? '',
      ),
    );

    dio.interceptors.addAll(interceptors);

    if (Diolog().showDebug) {
      dio.interceptors.add(SDSDioLogInterceptor());
    }

    return dio;
  }
}
