import 'package:dio/dio.dart' as di;
import 'package:http_parser/http_parser.dart';
import 'package:v_bhxh/clean/core/data/data_source/network/network_src.dart';
import 'package:v_bhxh/modules/register_code/domain/entity/certificate.dart';

import '../../../../clean/core/data/model/model_src.dart';
import '../../../../clean/shared/mapper/certificate_data_mapper.dart';
import '../../../../clean/shared/mapper/first_time_register_request_data_mapper.dart';
import '../../../../clean/shared/mapper/register_code_categories_data_mapper.dart';
import '../../../src.dart';
import '../../domain/entity/first_time_register_request.dart';
import '../../domain/entity/register_code_categories.dart';
import '../../domain/repository/register_code_repository.dart';
import '../model/certificate_data.dart';
import '../model/register_code_categories_data.dart';

const _signDocumentTimeOut = Duration(minutes: 3);

class RegisterCodeRepositoryImpl extends RegisterCodeRepository {
  final AuthAppServerApiClient _authAppServerApiClient;
  final CertificateDataMapper _certificateDataMapper;
  final RegisterCodeCategoriesDataMapper _registerCodeCategoriesDataMapper;
  final FirstTimeRegisterRequestDataMapper _firstTimeRegisterRequestDataMapper;

  RegisterCodeRepositoryImpl(
    this._authAppServerApiClient,
    this._certificateDataMapper,
    this._registerCodeCategoriesDataMapper,
    this._firstTimeRegisterRequestDataMapper,
  );

  @override
  Future<RegisterCodeCategories> getCategories() async {
    final response = await _authAppServerApiClient.request(
      method: RestMethod.get,
      path: AppApi.urlGetRegisterFirstCategories,
      cancelToken: cancelToken,
    );

    final data = BaseResponseCl<RegisterCodeCategoriesData>.fromJson(
      response,
      fromJson: (json) => RegisterCodeCategoriesData.fromJson(json),
    );
    return _registerCodeCategoriesDataMapper.mapToEntity(data.result);
  }

  @override
  Future<List<Certificate>> getListCert({
    required String userId,
  }) async {
    final response = await _authAppServerApiClient.request(
        method: RestMethod.get,
        path: AppApi.urlGetListCert,
        cancelToken: cancelToken,
        queryParameters: {
          'userId': userId,
        });
    final data = BaseResponseListCl<CertificateData>.fromJson(
      response,
      CertificateData.fromJson,
    ).result;

    return _certificateDataMapper.mapToListEntity(data);
  }

  @override
  Future<BaseResponseCl<bool>> firstTimeRegister({
    required FirstTimeRegisterRequest request,
  }) async {
    final requestData = _firstTimeRegisterRequestDataMapper.mapToData(request);
    final mapData = requestData.toJson();

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

    final response = await _authAppServerApiClient.request(
      method: RestMethod.post,
      path: AppApi.urlRegisterFirstForCode,
      cancelToken: cancelToken,
      body: formData,
      options: di.Options(
        receiveTimeout: _signDocumentTimeOut,
      ),
    );
    return BaseResponseCl<bool>.fromJson(response);
  }
}
