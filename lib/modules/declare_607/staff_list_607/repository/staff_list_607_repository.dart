import 'package:dio/dio.dart' as di;
import 'package:http_parser/http_parser.dart';
import 'package:v_bhxh/base_app/model/base_response.dart';
import 'package:v_bhxh/base_app/repository_base/base_repository.dart';
import 'package:v_bhxh/core/enum/enum_request_method.dart';
import 'package:v_bhxh/core/values/app_api.dart';
import 'package:v_bhxh/shares/model/upload_attachments_request.dart';
import 'package:v_bhxh/modules/declare_607/staff_list_607/model/model_src.dart';

class StaffList607Repository extends BaseRepository {
  StaffList607Repository(super.controller);

  Future<BaseResponse<StaffList607Response>> getStaffList({
    required String declarationPeriodId,
  }) async {
    final response = await baseCallApi(
      AppApi.urlGetStaffList607,
      EnumRequestMethod.get,
      jsonMap: {
        "kyKeKhaiId": declarationPeriodId,
      },
    );
    return BaseResponse<StaffList607Response>.fromJson(
      response,
      fromJson: (json) => StaffList607Response.fromJson(json),
    );
  }

  Future<BaseResponse<String>> uploadImage({
    required UploadImageRequest request,
  }) async {
    final mapData = request.toJson();

    if (request.file.isNotEmpty) {
      final filePath = request.file;
      final fileName = filePath.split('/').lastOrNull ?? '';

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

      mapData["file"] = multipartFile;
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

  Future<BaseResponse<SaveXml607Result>> saveXml({
    required String declarationPeriodId,
  }) async {
    final response = await baseCallApi(
      AppApi.urlSaveXml607,
      EnumRequestMethod.post,
      queryParameters: {
        "kyKeKhaiId": declarationPeriodId,
      },
      // Có thể việc gen pdf ở BE tốn thời gian, nên cần tăng thời gian timeout
      timeOut: const Duration(minutes: 2),
    );
    return BaseResponse<SaveXml607Result>.fromJson(
      response,
      fromJson: (json) => SaveXml607Result.fromJson(json),
    );
  }

  Future<BaseResponse> deleteImage(
    String kyKeKhaiId,
    String fileName,
  ) async {
    final response = await baseCallApi(
      "/api/Upload/delete-images/$kyKeKhaiId/$fileName",
      EnumRequestMethod.delete,
    );
    return BaseResponse.fromJson(response);
  }

  // Future<BaseResponse> deleteD02Tk1D01({required String id}) async {
  //   final response = await baseCallApi(
  //     AppApi.urlDeleteD02Tk1D01,
  //     EnumRequestMethod.delete,
  //     queryParameters: {
  //       "id": id,
  //     },
  //   );
  //   return BaseResponse.fromJson(response);
  // }
}
