import 'package:dio/dio.dart' as di;
import 'package:http_parser/http_parser.dart';
import 'package:v_bhxh/base_app/base_app.src.dart';
import 'package:v_bhxh/core/core.src.dart';

import '../models/model_src.dart';

class CertificateRepositoryICare extends BaseRepository {
  CertificateRepositoryICare(super.controller);

  Future<BaseResponseIcare<String>> registerSocial({
    required RegisterRequest request,
    bool isRegisterFirst = true,
  }) async {
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
      isRegisterFirst ? AppApi.urlFirstRegister : AppApi.urlRegisterService,
      EnumRequestMethod.post,
      jsonMap: formData,
      timeOut: Duration(minutes: 2),
    );
    return BaseResponseIcare<String>.fromJson(
      response,
      fromJson: (json) => json.toString(),
    );
  }
}
