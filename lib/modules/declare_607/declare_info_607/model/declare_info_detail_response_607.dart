import 'package:v_bhxh/modules/declare/declare_info/model/d02/d02_detail/d01_detail_response.dart';
import 'package:v_bhxh/modules/declare/declare_info/model/d02/d02_detail/member_detail_response.dart';
import 'package:v_bhxh/modules/declare_607/declare_info_607/model/tk1_detail_response_607.dart';

class DeclareInfoDetailResponse607 {
  final Tk1DetailResponse607 tk1Ts;
  final List<MemberDetailResponse> familyMembers;
  final List<D01DetailResponse> d01Dts;

  const DeclareInfoDetailResponse607({
    required this.tk1Ts,
    required this.familyMembers,
    required this.d01Dts,
  });

  factory DeclareInfoDetailResponse607.fromJson(Map<String, dynamic> json) {
    return DeclareInfoDetailResponse607(
      tk1Ts: Tk1DetailResponse607.fromJson(json['tk1ts']),
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
