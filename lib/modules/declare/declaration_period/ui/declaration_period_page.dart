import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:v_bhxh/modules/declare/declaration_period/controller/declaration_period_controller.dart';
import 'package:v_bhxh/modules/declare/declaration_period/model/model_src.dart';
import 'package:v_bhxh/modules/declare/declare_info/model/model_src.dart';
import 'package:v_bhxh/modules/src.dart';

part 'declaration_period_widget.dart';

class DeclarationPeriodPage extends BaseGetWidget<DeclarationPeriodController> {
  DeclarationPeriodPage({super.key});

  @override
  DeclarationPeriodController get controller => _controller;

  late final _controller = Get.put(DeclarationPeriodController());

  @override
  Widget buildWidgets(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(
        title: BaseAppBarTitle(title: LocaleKeys.declarationPeriod_title.tr),
      ),
      body: SafeArea(
        child: _buildBody(),
      ),
    );
  }
}
