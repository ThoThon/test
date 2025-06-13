import '../../../base_app/base_app.src.dart';
import '../../src.dart';

class HistoryRepository extends BaseRepository {
  HistoryRepository(super.controller);

  Future<BaseResponse<HistoryResponse<HistoryDeclareItemModel>>>
      getHistoryDeclare(HistoryDeclareRequest request) async {
    final response = await baseCallApi(
      AppApi.urlGetHistoryDeclare,
      EnumRequestMethod.post,
      jsonMap: request.toJson(),
    );
    return BaseResponse<HistoryResponse<HistoryDeclareItemModel>>.fromJson(
      response,
      fromJson: (json) => HistoryResponse.fromJson(
        json,
        (json) => HistoryDeclareItemModel.fromJson(json),
      ),
    );
  }

  Future<BaseResponseList<ListProcedureFilterModel>>
      getListProcedureFilter() async {
    final response = await baseCallApi(
      AppApi.urlGetListProcedureHistory,
      EnumRequestMethod.get,
    );
    return BaseResponseList<ListProcedureFilterModel>.fromJson(
      response,
      (json) => ListProcedureFilterModel.fromJson(json),
    );
  }

  Future<BaseResponse<HistoryResponse<HistoryRegisterItemModel>>>
      getHistoryRegister(HistoryRegisterRequest request) async {
    final response = await baseCallApi(
      AppApi.urlGetHistoryRegister,
      EnumRequestMethod.post,
      jsonMap: request.toJson(),
    );
    return BaseResponse<HistoryResponse<HistoryRegisterItemModel>>.fromJson(
      response,
      fromJson: (json) => HistoryResponse.fromJson(
        json,
        (json) => HistoryRegisterItemModel.fromJson(json),
      ),
    );
  }
}
