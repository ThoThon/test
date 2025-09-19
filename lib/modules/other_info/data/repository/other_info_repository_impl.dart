import 'package:v_bhxh/clean/shared/mapper/other_info_data_mapper.dart';
import 'package:v_bhxh/clean/shared/mapper/save_xml_result_data_mapper.dart';
import 'package:v_bhxh/clean/shared/model/model_src.dart';
import 'package:v_bhxh/core/values/app_api.dart';
import 'package:v_bhxh/modules/declare/staff_list/data/model/save_xml_result_data.dart';
import 'package:v_bhxh/modules/declare/staff_list/domain/entity/save_xml_result.dart';
import 'package:v_bhxh/modules/other_info/data/model/other_info_data.dart';
import 'package:v_bhxh/modules/other_info/domain/entity/other_info.dart';
import 'package:v_bhxh/modules/other_info/domain/repository/other_info_repository.dart';

import '../../../../clean/core/data/data_source/network/network_src.dart';

class OtherInfoRepositoryImpl extends OtherInfoRepository {
  final AuthAppServerApiClient _authAppServerApiClient;
  final OtherInfoDataMapper _otherInfoDataMapper;
  final SaveXmlResultDataMapper _saveXmlResultDataMapper;

  OtherInfoRepositoryImpl(
    this._authAppServerApiClient,
    this._otherInfoDataMapper,
    this._saveXmlResultDataMapper,
  );

  @override
  Future<String> addOtherInfo({
    required OtherInfo request,
  }) async {
    final response = await _authAppServerApiClient.request(
      method: RestMethod.post,
      path: AppApi.urlAddMs,
      cancelToken: cancelToken,
      body: _otherInfoDataMapper.mapToData(request).toJson(),
    );
    final data = BaseResponseCl<String>.fromJson(response);

    return data.result ?? '';
  }

  @override
  Future<OtherInfo> getOtherInfoDetail({
    required String key,
  }) async {
    final response = await _authAppServerApiClient.request(
      method: RestMethod.get,
      path: AppApi.urlGetDetailMs,
      cancelToken: cancelToken,
      body: {"key": key},
    );

    final data = BaseResponseCl<OtherInfoData>.fromJson(
      response,
      fromJson: (json) => OtherInfoData.fromJson(json),
    );
    return _otherInfoDataMapper.mapToEntity(data.result);
  }

  @override
  Future<bool> updateOtherInfo({
    required OtherInfo request,
  }) async {
    final response = await _authAppServerApiClient.request(
      method: RestMethod.post,
      path: AppApi.urlUpdateMs,
      cancelToken: cancelToken,
      body: _otherInfoDataMapper.mapToData(request).toJson(),
    );
    final data = BaseResponseCl<bool>.fromJson(response);

    return data.result ?? false;
  }

  @override
  Future<SaveXmlResultCl> saveXml630a({
    required String declarationPeriodId,
  }) async {
    final response = await _authAppServerApiClient.request(
      method: RestMethod.post,
      path: AppApi.urlSaveXml630a,
      cancelToken: cancelToken,
      queryParameters: {
        "kyKeKhaiId": declarationPeriodId,
      },
    );
    final data = BaseResponseCl<SaveXmlResultData>.fromJson(
      response,
      fromJson: (json) => SaveXmlResultData.fromJson(json),
    );

    return _saveXmlResultDataMapper.mapToEntity(data.result);
  }

  @override
  Future<SaveXmlResultCl> saveXml630b({
    required String declarationPeriodId,
  }) async {
    final response = await _authAppServerApiClient.request(
      method: RestMethod.post,
      path: AppApi.urlSaveXml630b,
      cancelToken: cancelToken,
      queryParameters: {
        "kyKeKhaiId": declarationPeriodId,
      },
    );
    final data = BaseResponseCl<SaveXmlResultData>.fromJson(
      response,
      fromJson: (json) => SaveXmlResultData.fromJson(json),
    );

    return _saveXmlResultDataMapper.mapToEntity(data.result);
  }

  @override
  Future<SaveXmlResultCl> saveXml630c({
    required String declarationPeriodId,
  }) async {
    final response = await _authAppServerApiClient.request(
      method: RestMethod.post,
      path: AppApi.urlSaveXml630c,
      cancelToken: cancelToken,
      queryParameters: {
        "kyKeKhaiId": declarationPeriodId,
      },
    );
    final data = BaseResponseCl<SaveXmlResultData>.fromJson(
      response,
      fromJson: (json) => SaveXmlResultData.fromJson(json),
    );

    return _saveXmlResultDataMapper.mapToEntity(data.result);
  }
}
