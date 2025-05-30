import 'package:dio/dio.dart' as di;
import 'package:http_parser/http_parser.dart';
import 'package:v_bhxh/base_app/model/base_response.dart';
import 'package:v_bhxh/base_app/repository_base/base_repository.dart';
import 'package:v_bhxh/modules/declare/staff_list/model/model_src.dart';
import 'package:v_bhxh/modules/src.dart';

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
    return BaseResponse<StaffListResponse>.fromJson(
      response,
      fromJson: (json) => StaffListResponse.fromJson(json),
    );
  }

  Future<BaseResponse<String>> uploadImage({
    required UploadImageRequest request,
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
      AppApi.urlUpLoadImage,
      EnumRequestMethod.post,
      jsonMap: formData,
    );
    return BaseResponse<String>.fromJson(
      response,
      fromJson: (json) => json.toString(),
    );
  }

  Future<BaseResponse<SaveXmlResult>> saveXml({
    required String declarationPeriodId,
  }) async {
    final response = await baseCallApi(
      AppApi.urlSaveXml,
      EnumRequestMethod.post,
      queryParameters: {
        "kyKeKhaiId": declarationPeriodId,
      },
      // Có thể việc gen pdf ở BE tốn thời gian, nên cần tăng thời gian timeout
      timeOut: const Duration(minutes: 2),
    );
    return BaseResponse<SaveXmlResult>.fromJson(
      response,
      fromJson: (json) => SaveXmlResult.fromJson(json),
    );
  }

  Future<BaseResponse> deleteImage(String kyKeKhaiId, String fileName) async {
    final response = await baseCallApi(
      "/api/Upload/delete-images/$kyKeKhaiId/$fileName",
      EnumRequestMethod.delete,
    );
    return BaseResponse.fromJson(response);
  }
}
