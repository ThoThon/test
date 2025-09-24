import 'package:dio/dio.dart';
import 'package:v_bhxh/clean/core/data/data_source/network/network_src.dart';
import 'package:v_bhxh/clean/shared/mapper/get_preview_pdf_request_data_mapper.dart';
import 'package:v_bhxh/modules/declare/declaration_list_clean/domain/entity/get_preview_pdf_request_cl.dart';
import 'package:v_bhxh/modules/src.dart';

import '../../../../../clean/core/data/model/base_response_cl.dart';
import '../../../../../clean/shared/constants/const.dart';
import '../../domain/repository/declaration_list_repository_cl.dart';

// Có thể việc gen pdf ở BE tốn thời gian, nên cần tăng thời gian timeout
const _getPreviewPdfTimeOut = Duration(minutes: 2);

class DeclarationListRepositoryImpl extends DeclarationListRepositoryCl {
  final AuthAppServerApiClient _authAppServerApiClient;
  final GetPreviewPdfRequestDataMapper _getPreviewPdfRequestDataMapper;
  DeclarationListRepositoryImpl(
    this._authAppServerApiClient,
    this._getPreviewPdfRequestDataMapper,
  );
  final _cachedPdfUrls = <GetPreviewPdfRequestCl, String?>{};

  @override
  Future<String> getPreviewPdf({
    required GetPreviewPdfRequestCl request,
  }) async {
    final cachedUrl = _cachedPdfUrls[request];
    if (cachedUrl != null) {
      return cachedUrl;
    }

    final response = await _authAppServerApiClient.request(
      method: RestMethod.post,
      path: AppApi.urlGetPreviewPdf,
      cancelToken: cancelToken,
      queryParameters:
          _getPreviewPdfRequestDataMapper.mapToData(request).toJson(),
      options: Options(
        receiveTimeout: _getPreviewPdfTimeOut,
      ),
    );

    final data = BaseResponseCl<String>.fromJson(response);

    // Lưu URL vào cache
    if (data.isSuccess && data.result is String) {
      _cachedPdfUrls[request] = data.result;
    }
    return data.result ?? '';
  }

  @override
  Future<String> getPreviewPdf607({
    required GetPreviewPdfRequestCl request,
  }) async {
    final cachedUrl = _cachedPdfUrls[request];
    if (cachedUrl != null) {
      return cachedUrl;
    }
    final response = await _authAppServerApiClient.request(
      method: RestMethod.post,
      path: AppApi.urlGetPreviewPdf607,
      cancelToken: cancelToken,
      queryParameters:
          _getPreviewPdfRequestDataMapper.mapToData(request).toJson(),
      options: Options(
        receiveTimeout: _getPreviewPdfTimeOut,
      ),
    );
    final data = BaseResponseCl<String>.fromJson(response);

    // Lưu URL vào cache
    if (data.isSuccess && data.result is String) {
      _cachedPdfUrls[request] = data.result;
    }
    return data.result ?? '';
  }

  @override
  Future<String> getPreviewPdf630a({
    required GetPreviewPdfRequestCl request,
  }) async {
    final cachedUrl = _cachedPdfUrls[request];
    if (cachedUrl != null) {
      return cachedUrl;
    }
    final response = await _authAppServerApiClient.request(
      method: RestMethod.post,
      path: AppApi.urlGetPreviewPdf630a,
      cancelToken: cancelToken,
      queryParameters:
          _getPreviewPdfRequestDataMapper.mapToData(request).toJson(),
      options: Options(
        receiveTimeout: _getPreviewPdfTimeOut,
      ),
    );
    final data = BaseResponseCl<String>.fromJson(response);

    // Lưu URL vào cache
    if (data.isSuccess && data.result is String) {
      _cachedPdfUrls[request] = data.result;
    }
    return data.result ?? '';
  }

  @override
  Future<String> getPreviewPdf630b({
    required GetPreviewPdfRequestCl request,
  }) async {
    final cachedUrl = _cachedPdfUrls[request];
    if (cachedUrl != null) {
      return cachedUrl;
    }
    final response = await _authAppServerApiClient.request(
      method: RestMethod.post,
      path: AppApi.urlGetPreviewPdf630b,
      cancelToken: cancelToken,
      queryParameters:
          _getPreviewPdfRequestDataMapper.mapToData(request).toJson(),
      options: Options(
        receiveTimeout: _getPreviewPdfTimeOut,
      ),
    );
    final data = BaseResponseCl<String>.fromJson(response);

    // Lưu URL vào cache
    if (data.isSuccess && data.result is String) {
      _cachedPdfUrls[request] = data.result;
    }
    return data.result ?? '';
  }

  @override
  Future<String> getPreviewPdf630c({
    required GetPreviewPdfRequestCl request,
  }) async {
    final cachedUrl = _cachedPdfUrls[request];
    if (cachedUrl != null) {
      return cachedUrl;
    }
    final response = await _authAppServerApiClient.request(
      method: RestMethod.post,
      path: AppApi.urlGetPreviewPdf630c,
      cancelToken: cancelToken,
      queryParameters:
          _getPreviewPdfRequestDataMapper.mapToData(request).toJson(),
      options: Options(
        receiveTimeout: _getPreviewPdfTimeOut,
      ),
    );
    final data = BaseResponseCl<String>.fromJson(response);

    // Lưu URL vào cache
    if (data.isSuccess && data.result is String) {
      _cachedPdfUrls[request] = data.result;
    }
    return data.result ?? '';
  }

  @override
  Future<bool> signDocument({
    required String declarationPeriodId,
  }) async {
    final response = await _authAppServerApiClient.request(
      method: RestMethod.post,
      path: AppApi.urlSignDocument,
      cancelToken: cancelToken,
      queryParameters: {
        "kyKeKhaiId": declarationPeriodId,
      },
      options: Options(
        receiveTimeout: signDocumentTimeOut,
      ),
    );
    final data = BaseResponseCl<bool>.fromJson(response);
    return data.result ?? false;
  }
}
