import 'package:v_bhxh/modules/declare/declare_info/model/d02/d01_request.dart';
import 'package:v_bhxh/modules/declare/declare_info/model/d02/d02_request.dart';
import 'package:v_bhxh/modules/declare/declare_info/model/d02/family_member_request.dart';
import 'package:v_bhxh/modules/declare/declare_info/model/d02/tk1_request.dart';

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
}
