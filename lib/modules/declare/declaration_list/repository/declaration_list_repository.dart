import 'package:v_bhxh/base_app/model/base_response.dart';
import 'package:v_bhxh/base_app/repository_base/base_repository.dart';
import 'package:v_bhxh/modules/declare/declaration_list/model/get_preview_pdf_request.dart';
import 'package:v_bhxh/modules/src.dart';

const _signDocumentTimeOut = Duration(minutes: 3);

class DeclarationListRepository extends BaseRepository {
  DeclarationListRepository(super.controller);

  final _cachedPdfUrls = <GetPreviewPdfRequest, String?>{};

  Future<BaseResponse> signDocument({
    required String declarationPeriodId,
  }) async {
    final response = await baseCallApi(
      AppApi.urlSignDocument, EnumRequestMethod.post,
      queryParameters: {
        "kyKeKhaiId": declarationPeriodId,
      },
      // Cần chờ user mở app mysign để ký số nên set timeout là 3 phút
      timeOut: _signDocumentTimeOut,
      functionError: (err) {
        // rethrow error để xử lý ở controller
        throw err;
      },
    );
    return BaseResponse.fromJson(response);
  }

  Future<BaseResponse> getPreviewPdf({
    required GetPreviewPdfRequest request,
  }) async {
    final cachedUrl = _cachedPdfUrls[request];
    if (cachedUrl != null) {
      return BaseResponse(
        code: AppConst.statusCodeSuccess,
        result: cachedUrl,
        errorMessage: '',
      );
    }

    final response = await baseCallApi(
      AppApi.urlGetPreviewPdf, EnumRequestMethod.post,
      jsonMap: request.toJson(),
      // Có thể việc gen pdf ở BE tốn thời gian, nên cần tăng thời gian timeout
      timeOut: const Duration(minutes: 2),
    );

    final result = BaseResponse.fromJson(response);

    // Lưu URL vào cache
    if (result.isSuccess && result.result is String) {
      _cachedPdfUrls[request] = result.result;
    }

    return result;
  }

  Future<BaseResponse> getPreviewPdf607({
    required GetPreviewPdfRequest request,
  }) async {
    final cachedUrl = _cachedPdfUrls[request];
    if (cachedUrl != null) {
      return BaseResponse(
        code: AppConst.statusCodeSuccess,
        result: cachedUrl,
        errorMessage: '',
      );
    }

    final response = await baseCallApi(
      AppApi.urlGetPreviewPdf607, EnumRequestMethod.post,
      jsonMap: request.toJson(),
      // Có thể việc gen pdf ở BE tốn thời gian, nên cần tăng thời gian timeout
      timeOut: const Duration(minutes: 2),
    );

    final result = BaseResponse.fromJson(response);

    // Lưu URL vào cache
    if (result.isSuccess && result.result is String) {
      _cachedPdfUrls[request] = result.result;
    }

    return result;
  }


  Future<BaseResponse> getPreviewPdf630a({
    required GetPreviewPdfRequest request,
  }) async {
    final cachedUrl = _cachedPdfUrls[request];
    if (cachedUrl != null) {
      return BaseResponse(
        code: AppConst.statusCodeSuccess,
        result: cachedUrl,
        errorMessage: '',
      );
    }

    final response = await baseCallApi(
      AppApi.urlGetPreviewPdf630a, EnumRequestMethod.post,
      jsonMap: request.toJson(),
      // Có thể việc gen pdf ở BE tốn thời gian, nên cần tăng thời gian timeout
      timeOut: const Duration(minutes: 2),
    );

    final result = BaseResponse.fromJson(response);

    // Lưu URL vào cache
    if (result.isSuccess && result.result is String) {
      _cachedPdfUrls[request] = result.result;
    }

    return result;
  }
}
