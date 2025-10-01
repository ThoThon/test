// import '../../../base_app/base_app.src.dart';
// import '../../src.dart';

// class HistoryDetailDeclareRepository extends BaseRepository {
//   HistoryDetailDeclareRepository(super.controller);

//   Future<BaseResponse<FileNumberModel>> getFileNumber(String key) async {
//     final response = await baseCallApi(
//       AppApi.urlGetFileNumber,
//       EnumRequestMethod.get,
//       jsonMap: {'key': key},
//     );
//     return BaseResponse<FileNumberModel>.fromJson(
//       response,
//       fromJson: (json) => FileNumberModel.fromJson(json),
//     );
//   }

//   Future<BaseResponse<ResultLookupHistoryDeclareModel>> lookupProcessHistory(
//       String soHoSo) async {
//     final response = await baseCallApi(
//       AppApi.urlLookupProgressHistory,
//       EnumRequestMethod.get,
//       jsonMap: {"soHoSo": soHoSo},
//     );
//     return BaseResponse<ResultLookupHistoryDeclareModel>.fromJson(
//       response,
//       fromJson: (json) => ResultLookupHistoryDeclareModel.fromJson(json),
//     );
//   }
// }
