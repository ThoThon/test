import 'package:dio/dio.dart' as di;
import 'package:http_parser/http_parser.dart';
import 'package:v_bhxh/modules/declare/staff_list/data/model/save_xml_result_data.dart';
import 'package:v_bhxh/modules/declare/staff_list/domain/entity/save_xml_result.dart';
import 'package:v_bhxh/modules/declare/staff_list/domain/entity/staff_list.dart';
import 'package:v_bhxh/modules/declare/staff_list/domain/repository/staff_list_repository.dart';

import '../../../../../clean/core/data/data_source/network/network_src.dart';
import '../../../../../clean/core/data/model/base_response_cl.dart';
import '../../../../../clean/shared/mapper/mapper_src.dart';
import '../../../../src.dart';
import '../model/staff_list_data.dart';

class StaffListRepositoryImpl extends StaffListRepository {
  final AuthAppServerApiClient _authAppServerApiClient;
  final SaveXmlResultDataMapper _saveXmlResultDataMapper;
  final StaffListDataMapper _staffListDataMapper;

  StaffListRepositoryImpl(
    this._authAppServerApiClient,
    this._staffListDataMapper,
    this._saveXmlResultDataMapper,
  );

  @override
  Future<bool> deleteD02Tk1D01({
    required String id,
  }) async {
    final response = await _authAppServerApiClient.request(
      method: RestMethod.delete,
      path: AppApi.urlDeleteD02Tk1D01,
      cancelToken: cancelToken,
      queryParameters: {
        "id": id,
      },
    );
    final data = BaseResponseCl<bool>.fromJson(response);
    return data.result ?? false;
  }

  @override
  Future<bool> deleteImage({
    required UploadImageRequest request,
  }) async {
    final response = await _authAppServerApiClient.request(
      method: RestMethod.delete,
      path: "/api/Upload/delete-images/${request.periodId}/${request.file}",
      cancelToken: cancelToken,
    );
    final data = BaseResponseCl<bool>.fromJson(response);
    return data.result ?? false;
  }

  @override
  Future<bool> deleteTk1D01({
    required String id,
  }) async {
    final response = await _authAppServerApiClient.request(
      method: RestMethod.delete,
      path: AppApi.urlDeleteTk1D01,
      cancelToken: cancelToken,
      queryParameters: {
        "id": id,
      },
    );
    final data = BaseResponseCl<bool>.fromJson(response);
    return data.result ?? false;
  }

  @override
  Future<StaffList> getListOfDeclaredStaff({
    required String declarationPeriodId,
  }) async {
    final response = await _authAppServerApiClient.request(
      method: RestMethod.get,
      path: AppApi.urlGetStaffList,
      cancelToken: cancelToken,
      queryParameters: {
        "kyKeKhaiId": declarationPeriodId,
      },
    );
    final data = BaseResponseCl<StaffListData>.fromJson(
      response,
      fromJson: (json) => StaffListData.fromJsonD02(json),
    );
    return _staffListDataMapper.mapToEntity(data.result);
  }

  @override
  Future<SaveXmlResultCl> saveXml({
    required String declarationPeriodId,
  }) async {
    final response = await _authAppServerApiClient.request(
      method: RestMethod.post,
      path: AppApi.urlSaveXml,
      cancelToken: cancelToken,
      queryParameters: {
        "kyKeKhaiId": declarationPeriodId,
      },
    );
    final data = BaseResponseCl.fromJson(
      response,
      fromJson: (json) => SaveXmlResultData.fromJson(json),
    );
    return _saveXmlResultDataMapper.mapToEntity(data.result);
  }

  @override
  Future<String> uploadImage({
    required UploadImageRequest request,
  }) async {
    final mapData = request.toJson();
    if (request.file.isNotEmpty) {
      final filePath = request.file;
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

      mapData["file"] = multipartFile;
    }
    final formData = di.FormData.fromMap(mapData);

    final response = await _authAppServerApiClient.request(
      method: RestMethod.post,
      path: AppApi.urlUpLoadImage,
      cancelToken: cancelToken,
      body: formData,
    );

    final data = BaseResponseCl<String>.fromJson(response);
    return data.result ?? '';
  }
}
