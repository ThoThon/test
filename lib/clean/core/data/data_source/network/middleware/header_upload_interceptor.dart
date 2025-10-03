import 'dart:io';
import 'package:dio/dio.dart';
import 'package:v_bhxh/clean/core/data/data_source/network/network_src.dart';
import 'package:v_bhxh/clean/shared/utils/app_info.dart';

class HeaderUploadInterceptor extends BaseInterceptor {
  HeaderUploadInterceptor(this._appInfo);

  final AppInfo _appInfo;

  /// Headers không có Transfer-Encoding: chunked
  /// Vì nếu có Transfer-Encoding: chunked sẽ lỗi khi upload file
  final _headers = <String, dynamic>{
    Headers.contentTypeHeader: Headers.jsonContentType,
    'Accept-Encoding': 'gzip, deflate, br',
    'Connection': 'keep-alive',
  };

  @override
  Future<void> onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    final userAgentValue = userAgentClientHintsHeader();
    options.headers['User-Agent'] = userAgentValue;
    options.headers.addAll(_headers);
    handler.next(options);
  }

  String userAgentClientHintsHeader() {
    return '${Platform.operatingSystem} - ${_appInfo.versionName}(${_appInfo.versionCode})';
  }
}
