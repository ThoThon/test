import 'package:dio/dio.dart' as di;
import 'package:http_parser/http_parser.dart';

import '../../../base_app/base_app.src.dart';
import '../../src.dart';

const _signDocumentTimeOut = Duration(minutes: 3);

class RegisterCodeRepository extends BaseRepository {
  RegisterCodeRepository(super.controller);

  Future<BaseResponse<RegisterCodeCategories>>
      getRegisterFirstCategories() async {
    final response = await baseCallApi(
      AppApi.urlGetRegisterFirstCategories,
      EnumRequestMethod.get,
    );
    return BaseResponse<RegisterCodeCategories>.fromJson(
      response,
      fromJson: (json) => RegisterCodeCategories.fromJson(json),
    );
  }

  Future<BaseResponseList<CertificateModel>> getListCert(String userId) async {
    final response = await baseCallApi(
      AppApi.urlGetListCert,
      EnumRequestMethod.get,
      jsonMap: {
        "userId": userId,
      },
    );
    return BaseResponseList<CertificateModel>.fromJson(
      response,
      (json) => CertificateModel.fromJson(json),
    );
  }

  Future<BaseResponse> registerCodeFirst(
    FirstRegisterRequest request,
  ) async {
    final mapData = request.toJson();

    if (request.imageFilePath != null && request.imageFilePath!.isNotEmpty) {
      final List<di.MultipartFile> multipartFiles = [];

      for (final filePath in request.imageFilePath!) {
        final fileName = filePath.split('/').last;

        String contentType;
        if (fileName.endsWith('.jpg') || fileName.endsWith('.jpeg')) {
          contentType = 'image/jpeg';
        } else if (fileName.endsWith('.png')) {
          contentType = 'image/png';
        } else if (fileName.endsWith('.pdf')) {
          contentType = 'application/pdf';
        } else {
          contentType = 'application/octet-stream';
        }

        final multipartFile = await di.MultipartFile.fromFile(
          filePath,
          filename: fileName,
          contentType: MediaType.parse(contentType),
        );

        multipartFiles.add(multipartFile);
      }

      mapData["TepDinhKem"] = multipartFiles;
    }

    final formData = di.FormData.fromMap(mapData);

    final response = await baseCallApi(
      AppApi.urlRegisterFirstForCode,
      EnumRequestMethod.post,
      jsonMap: formData,
      // Cần chờ user mở app mysign để ký số nên set timeout là 3 phút
      timeOut: _signDocumentTimeOut,
      functionError: (err) {
        // rethrow error để xử lý ở controller
        throw err;
      },
    );
    return BaseResponse.fromJson(response);
  }
}
