import 'package:v_bhxh/clean/shared/mapper/selected_staff_detail_data_mapper.dart';
import 'package:v_bhxh/clean/shared/mapper/selected_staff_request_data_mapper.dart';
import 'package:v_bhxh/clean/shared/mapper/selected_staff_response_data_mapper.dart';
import 'package:v_bhxh/clean/shared/model/model_src.dart';
import 'package:v_bhxh/modules/selected_staff/data/model/selected_staff_detail_data.dart';
import 'package:v_bhxh/modules/selected_staff/data/model/selected_staff_response_data.dart';
import 'package:v_bhxh/modules/selected_staff/domain/entity/selected_staff_detail.dart';
import 'package:v_bhxh/modules/selected_staff/domain/entity/selected_staff_response.dart';

import '../../../../clean/core/data/data_source/network/network_src.dart';
import '../../../../core/values/app_api.dart';
import '../../domain/entity/selected_staff_request.dart';
import '../../domain/repository/selected_staff_repository.dart';

class SelectStaffRepositoryImpl extends SelectStaffRepository {
  final AuthAppServerApiClient _authAppServerApiClient;
  final SelectStaffRequestDataMapper _selectStaffRequestDataMapper;
  final SelectStaffResponseDataMapper _selectStaffResponseDataMapper;
  final SelectedStaffDetailDataMapper _selectedStaffDetailDataMapper;

  SelectStaffRepositoryImpl(
    this._authAppServerApiClient,
    this._selectStaffRequestDataMapper,
    this._selectStaffResponseDataMapper,
    this._selectedStaffDetailDataMapper,
  );

  @override
  Future<SelectStaffResponse> getStaffListSelect({
    required SelectStaffRequest request,
  }) async {
    final response = await _authAppServerApiClient.request(
      method: RestMethod.post,
      path: AppApi.urlGetStaffListSelect,
      cancelToken: cancelToken,
      body: _selectStaffRequestDataMapper.mapToData(request).toJson(),
    );

    final data = BaseResponseCl<SelectStaffResponseData>.fromJson(
      response,
      fromJson: (json) => SelectStaffResponseData.fromJson(json),
    );
    return _selectStaffResponseDataMapper.mapToEntity(data.result);
  }

  @override
  Future<SelectedStaffDetail> getSelectedStaffDetail({
    required String idStaff,
  }) async {
    final response = await _authAppServerApiClient.request(
      method: RestMethod.get,
      path: AppApi.urlGetDetailStaff,
      cancelToken: cancelToken,
      queryParameters: {
        "idStaff": idStaff,
      },
    );
    final data = BaseResponseCl<SelectedStaffDetailData>.fromJson(
      response,
      fromJson: (json) => SelectedStaffDetailData.fromJson(json),
    );
    return _selectedStaffDetailDataMapper.mapToEntity(data.result);
  }
}
