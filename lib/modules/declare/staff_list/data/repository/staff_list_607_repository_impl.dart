import 'package:v_bhxh/modules/declare/staff_list/domain/entity/save_xml_result.dart';
import 'package:v_bhxh/modules/declare/staff_list/domain/entity/staff_list.dart';
import 'package:v_bhxh/modules/declare/staff_list/domain/repository/staff_list_607_repository.dart';

import '../../../../../clean/core/data/data_source/network/network_src.dart';
import '../../../../../clean/core/data/model/base_response_cl.dart';
import '../../../../../clean/shared/mapper/mapper_src.dart';
import '../../../../src.dart';
import '../model/save_xml_result_data.dart';
import '../model/staff_list_data.dart';

class StaffList607RepositoryImpl extends StaffList607Repository {
  final AuthAppServerApiClient _authAppServerApiClient;
  final StaffListDataMapper _staffListDataMapper;
  final SaveXmlResultDataMapper _saveXmlResultDataMapper;

  StaffList607RepositoryImpl(
    this._authAppServerApiClient,
    this._staffListDataMapper,
    this._saveXmlResultDataMapper,
  );

  @override
  Future<StaffList> getStaffList607({
    required String declarationPeriodId,
  }) async {
    final response = await _authAppServerApiClient.request(
      method: RestMethod.get,
      path: AppApi.urlGetStaffList607,
      cancelToken: cancelToken,
      queryParameters: {
        "kyKeKhaiId": declarationPeriodId,
      },
    );
    final data = BaseResponseCl.fromJson(
      response,
      fromJson: (json) => StaffListData.fromJsonTk1(json),
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
}
