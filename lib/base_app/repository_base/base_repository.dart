import 'package:dio/dio.dart';

import '../base_app.src.dart';

class BaseRepository {
  final BaseGetxController controller;

  BaseRepository(this.controller);

  /// [isQueryParametersPost]: `true`: phương thức post gửi params, mặc định = `false`
  ///
  /// [dioOptions]: option của Dio() sử dụng khi gọi api có option riêng
  ///
  /// [functionError]: chạy function riêng khi request xảy ra Exception (mặc định sử dụng [showDialogError])
  ///
  /// [enableChunkedTransfer]: `true`: sử dụng Transfer-Encoding là 'chunked' để BE tự tính content-length, nhằm tránh lỗi sai content-length,
  /// với api upload file phải set là `false` để tránh lỗi "Connection closed before full header was received"
  Future<dynamic> baseCallApi(
    String action,
    String requestMethod, {
    dynamic jsonMap,
    Map<String, dynamic>? queryParameters,
    bool isDownload = false,
    String? urlOther,
    Map<String, String>? headersUrlOther,
    BaseOptions? dioOptions,
    bool isToken = true,
    Function(Object error)? functionError,
    Duration? timeOut,
    bool getHeader = false,
    bool enableChunkedTransfer = true,
  }) {
    return BaseApi().callApi(
      action,
      requestMethod,
      jsonMap: jsonMap,
      queryParameters: queryParameters,
      isDownload: isDownload,
      urlOther: urlOther,
      headersUrlOther: headersUrlOther,
      controller: controller,
      dioOptions: dioOptions,
      functionError: functionError,
      isToken: isToken,
      timeOut: timeOut,
      getHeader: getHeader,
      enableChunkedTransfer: enableChunkedTransfer,
    );
  }
}
