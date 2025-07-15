import 'package:v_bhxh/modules/declare/declare_info/model/d01_state.dart';
import 'package:v_bhxh/modules/declare/declare_info/model/d02/d01_request.dart';
import 'package:v_bhxh/modules/declare/declare_info/model/d02/family_member_request.dart';
import 'package:v_bhxh/modules/declare_607/declare_info_607/model/tk1_request_607.dart';
import 'package:v_bhxh/modules/declare_607/declare_info_607/model/tk1_state_607.dart';

class AddTk1Request607 {
  final Tk1Request607 tk1Ts;
  final List<FamilyMemberRequest> familyMembers;
  final List<D01Request> d01Dts;

  AddTk1Request607({
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

  static AddTk1Request607 fromState({
    required String kyKeKhaiId,
    required Tk1State607 tk1State,
    required D01State d01State,
  }) {
    return AddTk1Request607(
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
