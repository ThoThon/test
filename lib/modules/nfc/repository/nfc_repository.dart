// import 'package:dio/dio.dart';

// import '../../../base_app/base_app.src.dart';

// class NfcRepository extends BaseRepository {
//   NfcRepository(super.controller);

//   Future<BaseResponseBE> sendNfcRepository(
//       SendNfcRequestModel sendNfcRequestModel) async {
//     var response = await baseCallApi(
//       AppApi.sendNfcData,
//       EnumRequestMethod.post,
//       jsonMap: sendNfcRequestModel.toJson(),
//       isHaveVersion: false,
//     );
//     return BaseResponseBE.fromJson(response);
//   }

//   Future<BaseResponseBE> sendLiveNessRepository(
//       LiveNessRequestModel liveNessRequestModel) async {
//     FormData formData = FormData.fromMap(liveNessRequestModel.toJson());
//     var response = await baseCallApi(
//       AppApi.sendLiveNessData,
//       EnumRequestMethod.post,
//       jsonMap: formData,
//       isHaveVersion: false,
//       // timeOut: const Duration(milliseconds: AppConst.requestTimeOutLong),
//     );
//     return BaseResponseBE.fromJson(response);
//   }

//   Future<BaseResponseBE> sendLiveNessVideoRepository(
//       LiveNessRequestModel liveNessRequestModel) async {
//     FormData formData = FormData.fromMap(await liveNessRequestModel.toVideoJson());
//     var response = await baseCallApi(
//       AppApi.sendLiveNessVideo,
//       EnumRequestMethod.post,
//       jsonMap: formData,
//       isHaveVersion: false,
//       timeOut: const Duration(milliseconds: AppConst.requestTimeOutLong),
//     );
//     return BaseResponseBE.fromJson(response);
//   }
// }
