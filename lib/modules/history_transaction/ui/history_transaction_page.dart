import '../../src.dart';

part 'history_transaction_widget.dart';

class HistoryTransactionPage extends BaseGetWidget {
  HistoryTransactionPage({super.key});

  @override
  HistoryTransactionControllerICare get controller => _controller;

  late final _controller = Get.put(HistoryTransactionControllerICare());

  @override
  Widget buildWidgets(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        appBar: BaseAppBar(
          title: TextUtils(
            text: LocaleKeys.historyRegister_historyTransaction.tr,
            availableStyle: StyleEnum.subBold,
          ),
          leading: AppBarLeading(
            backFunc: Get.previousRoute == AppConst.dialogConfirm
                ? () {
                    final checkHaveUnitCode = controller.registerItem != null &&
                        controller.registerItem?.unitCode?.isNotEmpty == true;
                    Get.until(
                      (route) => checkHaveUnitCode
                          ? route.settings.name == AppRoutes.home.path
                          : route.settings.name ==
                              AppRoutes.declarationTaxCodeDetail.path,
                    );
                  }
                : null,
          ),
        ),
        body: _buildBody(),
      ),
    );
  }
}
