// import 'package:v_bhxh/modules/declaration_tax_code/ui/ui_src.dart';

// import '../../../base_app/base_app.src.dart';
// import '../history_detail_src.dart';

// class HistoryDetaiRepositoryICare extends BaseRepository {
//   HistoryDetaiRepositoryICare(super.controller);

//   Future<BaseResponse<ProcessDocumentModel>> searchProcessDocument({
//     required String key,
//   }) async {
//     final response = await baseCallApi(
//       AppApi.urlSearchProcessDocumentByKey,
//       EnumRequestMethod.get,
//       jsonMap: {"key": key},
//     );
//     return BaseResponse<ProcessDocumentModel>.fromJson(
//       response,
//       fromJson: (json) => ProcessDocumentModel.fromJson(json),
//     );
//   }

//   Future<BaseResponse> updateHistoryRigister({
//     required UpdateHistoryRigisterRequest request,
//   }) async {
//     final response = await baseCallApi(
//       AppApi.urlUpdateHistoryRigister,
//       EnumRequestMethod.post,
//       jsonMap: request.toJson(),
//     );
//     return BaseResponse.fromJson(
//       response,
//       fromJson: (json) => json,
//     );
//   }
// }
