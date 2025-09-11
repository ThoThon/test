import 'package:dio/dio.dart';
import 'package:v_bhxh/clean/core/data/data_source/network/network_src.dart';
import 'package:v_bhxh/clean/shared/mapper/certificate_data_mapper.dart';
import 'package:v_bhxh/clean/shared/mapper/register_service_request_data_mapper.dart';
import 'package:v_bhxh/clean/shared/mapper/transaction_info_data_mapper.dart';
import 'package:v_bhxh/core/values/app_api.dart';
import 'package:v_bhxh/modules/register_code/domain/entity/certificate.dart';

import '../../../../clean/core/data/model/model_src.dart';
import '../../../../clean/shared/constants/const.dart';
import '../../../register_code/data/model/certificate_data.dart';
import '../../register_service_src.dart';

class RegisterServiceRepositoryImpl extends RegisterServiceRepository {
  final AuthAppServerApiClient _authAppServerApiClient;
  final RegisterServiceRequestDataMapper _registerServiceRequestDataMapper;
  final CertificateDataMapper _certificateDataMapper;
  final TransactionInfoDataMapper _transactionInfoDataMapper;

  RegisterServiceRepositoryImpl(
    this._authAppServerApiClient,
    this._registerServiceRequestDataMapper,
    this._certificateDataMapper,
    this._transactionInfoDataMapper,
  );

  @override
  Future<TransactionInfo> getTransactionInfo() async {
    final response = await _authAppServerApiClient.request(
      method: RestMethod.get,
      path: AppApi.urlGetRegisterServiceInfo,
      cancelToken: cancelToken,
    );
    final data = BaseResponseCl<TransactionInfoData>.fromJson(
      response,
      fromJson: (json) => TransactionInfoData.fromJson(json),
    );
    return _transactionInfoDataMapper.mapToEntity(data.result);
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
      },
    );
    final data = BaseResponseListCl<CertificateData>.fromJson(
      response,
      CertificateData.fromJson,
    ).result;

    return _certificateDataMapper.mapToListEntity(data);
  }

  // Đăng ký
  @override
  Future<bool> registerNewService({
    required RegisterServiceRequest request,
  }) async {
    final response = await _authAppServerApiClient.request(
      method: RestMethod.post,
      path: AppApi.urlRegisterNewService,
      cancelToken: cancelToken,
      queryParameters:
          _registerServiceRequestDataMapper.mapToData(request).toJson(),
      options: Options(
        receiveTimeout: signDocumentTimeOut,
      ),
    );
    final data = BaseResponseCl<bool>.fromJson(response);
    return data.result ?? false;
  }

  // Cập nhật thông tin
  @override
  Future<bool> updateInfo({
    required RegisterServiceRequest request,
  }) async {
    final response = await _authAppServerApiClient.request(
      method: RestMethod.post,
      path: AppApi.urlChangeInfo,
      cancelToken: cancelToken,
      queryParameters:
          _registerServiceRequestDataMapper.mapToData(request).toJson(),
      options: Options(
        receiveTimeout: signDocumentTimeOut,
      ),
    );
    final data = BaseResponseCl<bool>.fromJson(response);
    return data.result ?? false;
  }

  // Ngừng đăng ký
  @override
  Future<bool> cancelRegister() async {
    final response = await _authAppServerApiClient.request(
      method: RestMethod.post,
      path: AppApi.urlCancelRegister,
      cancelToken: cancelToken,
      options: Options(
        receiveTimeout: signDocumentTimeOut,
      ),
    );
    final data = BaseResponseCl<bool>.fromJson(response);
    return data.result ?? false;
  }
}
