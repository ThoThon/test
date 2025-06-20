import 'package:dio/dio.dart' as di;
import 'package:http_parser/http_parser.dart';

import '../../../base_app/base_app.src.dart';
import '../../src.dart';

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

  Future<BaseResponse<String>> registerCodeFirst(
    FirstRegisterRequest request,
  ) async {
    final mapData = request.toJson();
    if (request.imageFilePath != null && request.imageFilePath!.isNotEmpty) {
      mapData["attachedFile"] = await Future.wait(
        request.imageFilePath!
            .map(
              (filePath) => di.MultipartFile.fromFile(
                filePath,
                filename: 'image',
                contentType: MediaType('image', 'jpg'),
              ),
            )
            .toList(),
      );
    }
    di.FormData formData = di.FormData.fromMap(mapData);
    final response = await baseCallApi(
      AppApi.urlRegisterFirstForCode,
      EnumRequestMethod.post,
      jsonMap: formData,
      timeOut: const Duration(minutes: 2),
    );
    return BaseResponse<String>.fromJson(
      response,
      fromJson: (json) => json.toString(),
    );
  }
}
