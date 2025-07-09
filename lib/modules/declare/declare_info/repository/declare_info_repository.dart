import 'package:v_bhxh/base_app/base_app.src.dart';
import 'package:v_bhxh/modules/declare/declare_info/model/d02/add_d02_request.dart';
import 'package:v_bhxh/modules/declare/declare_info/model/d02/d02_detail/declare_info_detail_response.dart';
import 'package:v_bhxh/modules/declare/declare_info/model/d02/update_d02_request.dart';
import 'package:v_bhxh/modules/declare_607/declare_info_607/model/model_src.dart';
import 'package:v_bhxh/modules/login/model/model_src.dart';

import '../../../src.dart';

// Key is provinceCode
final cachedDistricts = <String, List<DistrictModel>>{};
// Key is provinceCode
final cachedHospitals = <String, List<Hospital>>{};
// Key is (provinceCode, districtCode)
final cachedWards = <(String, String), List<WardModel>>{};

class DeclareInfoRepository extends BaseRepository {
  DeclareInfoRepository(super.controller);

  Future<BaseResponseList<DistrictModel>> getDistricts({
    required String provinceCode,
  }) async {
    if (cachedDistricts.containsKey(provinceCode)) {
      final districts = cachedDistricts[provinceCode];
      return BaseResponseList<DistrictModel>(
        code: AppConst.statusCodeSuccess,
        result: districts!,
        totalNumber: districts.length,
      );
    }

    final response = await baseCallApi(
      AppApi.urlGetDistricts,
      EnumRequestMethod.get,
      jsonMap: {
        "provinceCode": provinceCode,
      },
    );
    final result = BaseResponseList<DistrictModel>.fromJson(
      response,
      (json) => DistrictModel.fromJson(json),
    );

    if (result.isSuccess) {
      cachedDistricts[provinceCode] = result.result;
    }

    return result;
  }

  Future<BaseResponseList<WardModel>> getWards({
    required String provinceCode,
    required String districtCode,
  }) async {
    final key = (provinceCode, districtCode);
    if (cachedWards.containsKey(key)) {
      final wards = cachedWards[key];
      return BaseResponseList<WardModel>(
        code: AppConst.statusCodeSuccess,
        result: wards!,
        totalNumber: wards.length,
      );
    }

    final response = await baseCallApi(
      AppApi.urlGetWards,
      EnumRequestMethod.get,
      jsonMap: {
        "provinceCode": provinceCode,
        "districtCode": districtCode,
      },
    );
    final result = BaseResponseList<WardModel>.fromJson(
      response,
      (json) => WardModel.fromJson(json),
    );

    if (result.isSuccess) {
      cachedWards[key] = result.result;
    }

    return result;
  }

  Future<BaseResponseList<Hospital>> getHospitals({
    required String provinceCode,
  }) async {
    if (cachedHospitals.containsKey(provinceCode)) {
      final hospitals = cachedHospitals[provinceCode];
      return BaseResponseList<Hospital>(
        code: AppConst.statusCodeSuccess,
        result: hospitals!,
        totalNumber: hospitals.length,
      );
    }

    final response = await baseCallApi(
      AppApi.urlGetHospitals,
      EnumRequestMethod.get,
      jsonMap: {
        "provinceCode": provinceCode,
      },
    );
    final result = BaseResponseList<Hospital>.fromJson(
      response,
      (json) => Hospital.fromJson(json),
    );

    if (result.isSuccess) {
      cachedHospitals[provinceCode] = result.result;
    }

    return result;
  }

  Future<BaseResponse> addD02({
    required AddD02Request request,
  }) async {
    final response = await baseCallApi(
      AppApi.urlAddD02,
      EnumRequestMethod.post,
      jsonMap: request.toJson(),
    );
    return BaseResponse.fromJson(response);
  }

  Future<BaseResponse> updateD02({
    required UpdateD02Request request,
  }) async {
    final response = await baseCallApi(
      AppApi.urlUpdateD02,
      EnumRequestMethod.post,
      jsonMap: request.toJson(),
    );

    return BaseResponse.fromJson(response);
  }

  Future<BaseResponse<DeclareInfoDetailResponse>> getD02Detail({
    required String id,
  }) async {
    final response = await baseCallApi(
      AppApi.urlGetD02Detail,
      EnumRequestMethod.get,
      jsonMap: {
        "key": id,
      },
    );
    return BaseResponse<DeclareInfoDetailResponse>.fromJson(
      response,
      fromJson: (json) => DeclareInfoDetailResponse.fromJson(json),
    );
  }

  Future<BaseResponse> deleteMember({
    required String id,
  }) async {
    final response = await baseCallApi(
      AppApi.urlDeleteMember,
      EnumRequestMethod.delete,
      queryParameters: {
        "id": id,
      },
    );
    return BaseResponse.fromJson(response);
  }

  /// Xóa bảng kê
  Future<BaseResponse> deleteForm({
    required String id,
  }) async {
    final response = await baseCallApi(
      AppApi.urlDeleteForm,
      EnumRequestMethod.delete,
      queryParameters: {
        "id": id,
      },
    );
    return BaseResponse.fromJson(response);
  }

  /// Chi tiết nhân viên
  Future<BaseResponse<StaffDetailResponse>> getDetailStaff({
    required String id,
  }) async {
    final response = await baseCallApi(
      AppApi.urlGetDetailStaff,
      EnumRequestMethod.get,
      jsonMap: {
        "idStaff": id,
      },
    );
    return BaseResponse<StaffDetailResponse>.fromJson(
      response,
      fromJson: (json) => StaffDetailResponse.fromJson(json),
    );
  }

  Future<BaseResponse> addTk1({
    required AddTk1Request607 request,
  }) async {
    final response = await baseCallApi(
      AppApi.urlAddTk1,
      EnumRequestMethod.post,
      jsonMap: request.toJson(),
    );
    return BaseResponse.fromJson(response);
  }

  Future<BaseResponse<DeclareInfoDetailResponse607>> getTk1Detail({
    required String id,
  }) async {
    final response = await baseCallApi(
      AppApi.urlGetTk1Detail,
      EnumRequestMethod.get,
      jsonMap: {
        "key": id,
      },
    );
    return BaseResponse<DeclareInfoDetailResponse607>.fromJson(
      response,
      fromJson: (json) => DeclareInfoDetailResponse607.fromJson(json),
    );
  }

  Future<BaseResponse> updateTk1({
    required UpdateTk1Request request,
  }) async {
    final response = await baseCallApi(
      AppApi.urlUpdateTk1,
      EnumRequestMethod.post,
      jsonMap: request.toJson(),
    );

    return BaseResponse.fromJson(response);
  }
}
