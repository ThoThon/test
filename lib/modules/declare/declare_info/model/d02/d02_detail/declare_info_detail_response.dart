import 'd01_detail_response.dart';
import 'd02_detail_response.dart';
import 'member_detail_response.dart';
import 'tk1_detail_response.dart';

class DeclareInfoDetailResponse {
  final D02DetailResponse d02Lt;
  final Tk1DetailResponse tk1Ts;
  final List<MemberDetailResponse> familyMembers;
  final List<D01DetailResponse> d01Dts;

  const DeclareInfoDetailResponse({
    required this.d02Lt,
    required this.tk1Ts,
    required this.familyMembers,
    required this.d01Dts,
  });

  factory DeclareInfoDetailResponse.fromJson(Map<String, dynamic> json) {
    return DeclareInfoDetailResponse(
      d02Lt: D02DetailResponse.fromJson(json['d02Lt']),
      tk1Ts: Tk1DetailResponse.fromJson(json['tk1ts']),
      familyMembers: (json['phuLucThanhViens'] as List?)
              ?.map((e) => MemberDetailResponse.fromJson(e))
              .toList() ??
          [],
      d01Dts: (json['d01Dts'] as List?)
              ?.map((e) => D01DetailResponse.fromJson(e))
              .toList() ??
          [],
    );
  }
}
