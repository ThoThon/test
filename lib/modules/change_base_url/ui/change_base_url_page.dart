import 'package:bot_toast/bot_toast.dart';
import 'package:v_bhxh/modules/src.dart';
import 'package:v_bhxh/shares/base_url_helper/base_url_helper.dart';

class ChangeBaseUrlPage extends StatefulWidget {
  const ChangeBaseUrlPage({super.key});

  @override
  State<ChangeBaseUrlPage> createState() => _ChangeBaseUrlPageState();
}

class _ChangeBaseUrlPageState extends State<ChangeBaseUrlPage> {
  final urlTextCtrl = TextEditingController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      urlTextCtrl.text = BaseUrlHelper.instance.currentUrl;
    });
  }

  @override
  void dispose() {
    super.dispose();
    urlTextCtrl.dispose();
  }

  Future<void> _changeBaseUrl() async {
    final newUrl = urlTextCtrl.text.trim();
    if (newUrl.isEmpty || !GetUtils.isURL(newUrl)) {
      BotToast.showText(text: 'Đường dẫn không hợp lệ');
      return;
    }
    await BaseUrlHelper.instance.setBaseUrl(newUrl);
    BotToast.showText(text: 'Đường dẫn đã được thay đổi thành công');
    Get.back();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Thay đổi đường dẫn'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            _buildLogo(),
            const SizedBox(height: 20),
            BuildInputTextWithLabel(
              label: 'Nhập đường dẫn',
              buildInputText: BuildInputText(
                InputTextModel(controller: urlTextCtrl),
              ),
            ),
            const SizedBox(height: 20),
            UtilWidget.buildSolidButton(
              title: 'Thay đổi đường dẫn',
              height: 48,
              onPressed: _changeBaseUrl,
            ),
          ],
        ).paddingSymmetric(horizontal: AppDimens.defaultPadding),
      ),
    );
  }

  Widget _buildLogo() {
    return Center(
      child: SDSImageSvg(
        Assets.ASSETS_IMAGES_LOGO_VIETTEL_SVG,
        width: Get.width / 2,
      ),
    ).paddingOnly(top: AppDimens.padding25);
  }
}
