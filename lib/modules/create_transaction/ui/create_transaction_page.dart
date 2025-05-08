import 'package:flutter/material.dart';
import 'package:v_bhxh/base_app/base_app.src.dart';
import 'package:v_bhxh/core/core.src.dart';
import 'package:v_bhxh/generated/locales.g.dart';
import 'package:v_bhxh/modules/create_transaction/controller/controller_src.dart';
import 'package:v_bhxh/modules/create_transaction/ui/general_info_tab_page.dart';
import 'package:v_bhxh/modules/create_transaction/ui/register_info_tab_page.dart';
import 'package:v_bhxh/shares/shares.src.dart';

part 'widgets/create_transaction_widget.dart';

class CreateTransactionPage extends BaseGetWidget {
  CreateTransactionPage({super.key});

  @override
  TransactionControllerImpICare get controller => _controller;

  late final _controller = Get.put(TransactionControllerImpICare());

  @override
  Widget buildWidgets(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(
        title: TextUtils(
          text: LocaleKeys.transaction_transactionRegister.tr,
          availableStyle: StyleEnum.subBold,
        ),
      ),
      body: baseShowLoading(() => _buildBody()),
    );
  }
}
