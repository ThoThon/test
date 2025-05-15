import 'dart:io';

import 'package:v_bhxh/modules/declare/deposit_info/model/model_src.dart';
import 'package:v_bhxh/modules/src.dart';

import '../controller/controller_src.dart';

part 'deposit_info_widget.dart';

class DepositInfoPage extends BaseGetWidget<DepositInfoController> {
  DepositInfoPage({super.key});

  @override
  DepositInfoController get controller => _controller;

  late final _controller = Get.put(DepositInfoController());

  @override
  Widget buildWidgets(BuildContext context) {
    return Scaffold(
      appBar: const BaseAppBar(
        title: BaseAppBarTitle(
          title: 'Ký gửi',
        ),
      ),
      body: SafeArea(
        child: _buildBody(),
      ),
    );
  }
}
