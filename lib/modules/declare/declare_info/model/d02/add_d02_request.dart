import 'package:v_bhxh/modules/declare/declare_info/model/d02/d01_request.dart';
import 'package:v_bhxh/modules/declare/declare_info/model/d02/d02_request.dart';
import 'package:v_bhxh/modules/declare/declare_info/model/d02/family_member_request.dart';
import 'package:v_bhxh/modules/declare/declare_info/model/d02/tk1_request.dart';
import 'package:v_bhxh/modules/declare/declare_info/model/model_src.dart';

class AddD02Request {
  final D02Request d02Lt;
  final Tk1Request tk1Ts;
  final List<FamilyMemberRequest> familyMembers;
  final List<D01Request> d01Dts;

  AddD02Request({
    required this.d02Lt,
    required this.tk1Ts,
    required this.familyMembers,
    required this.d01Dts,
  });

  Map<String, dynamic> toJson() {
    return {
      'd02Lt': d02Lt.toJson(),
      'tk1Ts': tk1Ts.toJson(),
      'phuLucThanhViens': familyMembers.map((e) => e.toJson()).toList(),
      'd01Dts': d01Dts.map((e) => e.toJson()).toList(),
    };
  }

  static AddD02Request fromState({
    required String kyKeKhaiId,
    required D02Tk1State d02Tk1State,
    required D02State d02State,
    required Tk1State tk1State,
    required D01State d01State,
  }) {
    return AddD02Request(
      d02Lt: D02Request.fromState(
        kyKeKhaiId: kyKeKhaiId,
        d02Tk1State: d02Tk1State,
        d02State: d02State,
      ),
      tk1Ts: Tk1Request.fromState(tk1State: tk1State),
      familyMembers: FamilyMemberRequest.fromState(
        kyKeKhaiId: kyKeKhaiId,
        tk1State: tk1State,
        isUpdate: false, // Tạo mới thì isUpdate luôn là false
      ),
      d01Dts: D01Request.fromState(
        kyKeKhaiId: kyKeKhaiId,
        d01State: d01State,
        isUpdate: false, // Tạo mới thì isUpdate luôn là false
      ),
    );
  }
}
