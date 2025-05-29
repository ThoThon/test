import 'package:v_bhxh/base_app/repository_base/interceptor/jwt_token_interceptor.dart';

import '../../core/core.src.dart';
import '../../shares/log/dio_log.dart';
import '../../shares/package/export_package.dart';
import '../controllers_base/base_controller.src.dart';

class BaseApi {
  static final BaseApi _singleton = BaseApi._();

  factory BaseApi() => _singleton;

  BaseApi._();

  static Dio dio = getBaseDio();

  static Dio getBaseDio() {
    final dio = Dio();

    dio.options = buildDefaultOptions();

    dio.interceptors.add(JwtTokenInterceptor());
    if (Diolog().showDebug) {
      dio.interceptors.add(SDSDioLogInterceptor());
    }

    return dio;
  }

  static BaseOptions buildDefaultOptions({Duration? timeOut}) {
    return BaseOptions()
      ..connectTimeout =
          timeOut ?? const Duration(milliseconds: AppConst.requestTimeOut)
      ..receiveTimeout =
          timeOut ?? const Duration(milliseconds: AppConst.requestTimeOut);
  }

  static Dio getCurrentDio() {
    return dio;
  }

  void setOnErrorListener(Function(Object error) onErrorCallBack) {
    this.onErrorCallBack = onErrorCallBack;
  }

  late Function(Object error) onErrorCallBack;

  /// [isQueryParametersPost]: `true`: phương thức post gửi params, mặc định = `false`
  ///
  /// [dioOptions]: option của Dio() sử dụng khi gọi api có option riêng
  ///
  /// [functionError]: chạy function riêng khi request xảy ra Exception (mặc định sử dụng [showDialogError])
  Future<dynamic> callApi(
    String action,
    String requestMethod, {
    dynamic jsonMap,
    Map<String, dynamic>? queryParameters,
    bool isDownload = false,
    String? urlOther,
    Map<String, String>? headersUrlOther,
    required BaseGetxController controller,
    BaseOptions? dioOptions,
    Function(Object error)? functionError,
    bool isToken = true,
    bool isHaveVersion = true,
    bool getHeader = false,
    Duration? timeOut,
  }) async {
    dio.options = dioOptions ?? buildDefaultOptions(timeOut: timeOut);
    dynamic response;
    String url = urlOther ?? AppApi.url + action;
    Map<String, String> headers = isToken
        ? (headersUrlOther ?? getBaseHeader())
        : {"Content-Type": "application/json"};
    Options options = isDownload
        ? Options(
            headers: headers,
            responseType: ResponseType.bytes,
            followRedirects: false,
            validateStatus: (status) {
              return status != null && status < 500;
            })
        : Options(
            headers: headers,
            //method: requestMethod.toString(),
            responseType: ResponseType.json,
          );
    CancelToken cancelToken = CancelToken();
    controller.addCancelToken(cancelToken);
    try {
      if (requestMethod == EnumRequestMethod.post) {
        response = await dio.post(
          url,
          data: jsonMap,
          queryParameters: queryParameters,
          options: options,
          cancelToken: cancelToken,
        );
      } else if (requestMethod == EnumRequestMethod.delete) {
        response = await dio.delete(
          url,
          data: jsonMap,
          queryParameters: queryParameters,
          options: options,
          cancelToken: cancelToken,
        );
      } else if (requestMethod == EnumRequestMethod.put) {
        response = await dio.put(
          url,
          data: jsonMap,
          queryParameters: queryParameters,
          options: options,
          cancelToken: cancelToken,
        );
      } else {
        response = await dio.get(
          url,
          queryParameters: jsonMap,
          options: options,
          cancelToken: cancelToken,
        );
      }
      if (getHeader) {
        return response.headers.map;
      } else {
        return response.data;
      }
    } catch (e) {
      controller.cancelRequest(cancelToken);
      return functionError != null ? functionError(e) : showDialogError(e);
    }
  }

  dynamic showDialogError(dynamic e) {
    if (e.response?.data != null &&
        e.response.data is Map &&
        e.response.data["errorMessage"] != null) {
      return e.response.data;
    }
    onErrorCallBack(e);
  }

  Map<String, String> getBaseHeader() {
    return {
      "Content-Type": "application/json",
      // 'Authorization': hiveApp.get(AppKey.keyToken) ?? "",
      // 'Authorization': "Bearer 123456aA@",
      'Authorization': "",
    };
  }
}
