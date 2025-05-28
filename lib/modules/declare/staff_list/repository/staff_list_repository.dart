import 'package:dio/dio.dart' as di;
import 'package:http_parser/http_parser.dart';
import 'package:v_bhxh/base_app/model/base_response.dart';
import 'package:v_bhxh/base_app/repository_base/base_repository.dart';
import 'package:v_bhxh/core/enum/enum_request_method.dart';
import 'package:v_bhxh/core/values/app_api.dart';
import 'package:v_bhxh/modules/declare/staff_list/model/model_src.dart';
import 'package:v_bhxh/shares/function/logger.dart';

class StaffListRepository extends BaseRepository {
  StaffListRepository(super.controller);

  Future<BaseResponse<StaffListResponse>> getStaffList({
    required String declarationPeriodId,
  }) async {
    final response = await baseCallApi(
      AppApi.urlGetStaffList,
      EnumRequestMethod.get,
      jsonMap: {
        "kyKeKhaiId": declarationPeriodId,
      },
    );
    logger.d(declarationPeriodId);
    return BaseResponse<StaffListResponse>.fromJson(
      response,
      fromJson: (json) => StaffListResponse.fromJson(json),
    );
  }

  Future<BaseResponse<String>> uploadFile({
    required UploadAttachmentsRequest request,
  }) async {
    final mapData = request.toJson();

    if (request.file.isNotEmpty) {
      mapData["file"] = await Future.wait(
        request.file.map(
          (filePath) async {
            // Lấy tên file từ đường dẫn
            final fileName = filePath.split('/').last;

            // Tự xác định contentType đơn giản dựa trên phần mở rộng
            String? contentType;
            if (fileName.endsWith('.jpg') || fileName.endsWith('.jpeg')) {
              contentType = 'image/jpeg';
            } else if (fileName.endsWith('.png')) {
              contentType = 'image/png';
            } else if (fileName.endsWith('.pdf')) {
              contentType = 'application/pdf';
            } else {
              contentType = 'application/octet-stream';
            }

            return await di.MultipartFile.fromFile(
              filePath,
              filename: fileName,
              contentType: MediaType.parse(contentType),
            );
          },
        ),
      );
    }

    final formData = di.FormData.fromMap(mapData);

    final response = await baseCallApi(
      AppApi.urlUpLoadFile,
      EnumRequestMethod.post,
      jsonMap: formData,
    );

    logger.d(response);

    return BaseResponse<String>.fromJson(
      response,
      fromJson: (json) => json.toString(),
    );
  }
}
