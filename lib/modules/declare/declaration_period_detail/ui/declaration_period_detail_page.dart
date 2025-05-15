import 'dart:io';

import 'package:v_bhxh/modules/src.dart';

part 'declaration_period_detail_widget.dart';

class DeclarationPeriodDetailPage
    extends BaseGetWidget<DeclarationPeriodDetailController> {
  DeclarationPeriodDetailPage({super.key});

  @override
  DeclarationPeriodDetailController get controller => _controller;

  late final _controller = Get.put(DeclarationPeriodDetailController());

  @override
  Widget buildWidgets(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(
        title: BaseAppBarTitle(
          title: controller.declarationPeriod.title,
        ),
      ),
      body: SafeArea(
        child: _buildBody(),
      ),
    );
  }
}
