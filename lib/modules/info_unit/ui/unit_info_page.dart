import 'package:flutter/material.dart';
import 'package:v_bhxh/base_app/base_app.src.dart';
import 'package:v_bhxh/core/core.src.dart';
import 'package:v_bhxh/generated/locales.g.dart';
import 'package:v_bhxh/modules/info_unit/controller/controller_src.dart';
import 'package:v_bhxh/shares/shares.src.dart';

import '../../../assets.dart';
import '../../../shares/base/base.src.dart';

part 'widgets/unit_info_widget.dart';

class UnitInfoPage extends BaseGetWidget {
  UnitInfoPage({super.key});

  @override
  TransactionControllerImpICare get controller => _controller;

  late final _controller = Get.put(TransactionControllerImpICare());

  @override
  Widget buildWidgets(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(
        title: LocaleKeys.unitInfo_unitInfo.tr,
      ),
      body: baseShowLoading(() => _buildBody()),
    );
  }
}
