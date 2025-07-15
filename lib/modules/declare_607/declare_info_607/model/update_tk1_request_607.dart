import 'package:v_bhxh/modules/declare/declare_info/model/d02/d01_request.dart';
import 'package:v_bhxh/modules/declare/declare_info/model/d02/family_member_request.dart';
import 'package:v_bhxh/modules/declare/declare_info/model/model_src.dart';
import 'package:v_bhxh/modules/declare_607/declare_info_607/model/model_src.dart';

class UpdateTk1Request {
  final Tk1Request607 tk1Ts;
  final List<FamilyMemberRequest> familyMembers;
  final List<D01Request> d01Dts;

  UpdateTk1Request({
    required this.tk1Ts,
    required this.familyMembers,
    required this.d01Dts,
  });

  Map<String, dynamic> toJson() {
    return {
      'tk1ts': tk1Ts.toJson(),
      'phuLucThanhViens': familyMembers.map((e) => e.toJson()).toList(),
      'd01Dts': d01Dts.map((e) => e.toJson()).toList(),
    };
  }

  static UpdateTk1Request fromState({
    required String kyKeKhaiId,
    required Tk1State607 tk1State,
    required D01State d01State,
  }) {
    return UpdateTk1Request(
      tk1Ts: Tk1Request607.fromState(
        kyKeKhaiId: kyKeKhaiId,
        tk1State: tk1State,
      ),
      familyMembers: FamilyMemberRequest.fromState(
        kyKeKhaiId: kyKeKhaiId,
        familyMembers: tk1State.familyMembers,
      ),
      d01Dts: D01Request.fromState(
        kyKeKhaiId: kyKeKhaiId,
        d01State: d01State,
      ),
    );
  }
}
