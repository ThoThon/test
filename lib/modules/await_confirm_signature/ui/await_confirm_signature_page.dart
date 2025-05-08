import '../../src.dart';
import '../controller/controller_src.dart';

part 'await_confirm_signature_widget.dart';

class AwaitConfirmSignaturePage extends BaseGetWidget {
  @override
  AwaitConfirmSignatureControllerICare get controller => _controller;

  late final _controller = Get.put(AwaitConfirmSignatureControllerICare());

  AwaitConfirmSignaturePage({super.key});
  @override
  Widget buildWidgets(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(
        title: TextUtils(
          text: LocaleKeys.awaitConfirmSign_waitActive.tr,
          availableStyle: StyleEnum.subBold,
        ),
      ),
      body: baseShowLoadingCustom(
        () => _buildBody(),
        _buildAwait(),
      ),
    );
  }
}
