import 'dart:io';
import 'package:dio/dio.dart';
import 'package:v_bhxh/clean/core/data/data_source/network/network_src.dart';
import 'package:v_bhxh/clean/shared/utils/app_info.dart';

class HeaderInterceptor extends BaseInterceptor {
  HeaderInterceptor(this._appInfo);

  final AppInfo _appInfo;

  final _headers = <String, dynamic>{
    Headers.contentTypeHeader: Headers.jsonContentType,
    // Fix lỗi "Connection closed before full header was received" khi ký dữ liệu
    // REF: https://stackoverflow.com/a/77700014
    'Accept-Encoding': 'gzip, deflate, br',
    'Connection': 'keep-alive',
    // Set Transfer-Encoding là 'chunked' để BE tự tính content-length, nhằm tránh lỗi sai content-length
    'Transfer-Encoding': 'chunked',
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
