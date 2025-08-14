import 'dart:io';

import 'package:v_bhxh/clean/core/presentation/navigation/app_navigator.dart';
import 'package:v_bhxh/clean/shared/config/env_config.dart';
import 'package:v_bhxh/modules/src.dart';
import 'package:v_bhxh/shares/base_url_helper/base_url_helper_cl.dart';

class ChangeBaseUrlPage extends StatefulWidget {
  const ChangeBaseUrlPage({super.key});

  @override
  State<ChangeBaseUrlPage> createState() => _ChangeBaseUrlPageState();
}

class _ChangeBaseUrlPageState extends State<ChangeBaseUrlPage> {
  final _nav = Get.find<AppNavigator>();
  final _envConfig = Get.find<EnvConfig>();
  final _baseUrlHelper = Get.find<BaseUrlHelperCl>();
  late final _urlTextCtrl = TextEditingController(text: _baseUrlHelper.baseUrl);

  @override
  void dispose() {
    super.dispose();
    _urlTextCtrl.dispose();
  }

  Future<void> _changeBaseUrl() async {
    final newUrl = _urlTextCtrl.text.trim();
    if (newUrl.isEmpty || !GetUtils.isURL(newUrl)) {
      _nav.showSnackBar('Đường dẫn không hợp lệ');
      return;
    }
    await _baseUrlHelper.changeBaseUrl(newUrl);
    _showDialogConfirmReset();
  }

  Future<void> _resetBaseUrl() async {
    _urlTextCtrl.text = _envConfig.baseUrl;
    await _baseUrlHelper.resetBaseUrl();
    _showDialogConfirmReset();
  }

  void _showDialogConfirmReset() {
    _nav.showConfirmDialog(
      title: 'Đường dẫn đã được thay đổi thành công',
      subtitle: 'Khởi động lại ứng dụng để áp dụng thay đổi?',
      onConfirm: () {
        exit(0);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Thay đổi đường dẫn'),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _buildLogo(),
            const SizedBox(height: 20),
            BuildInputTextWithLabel(
              label: 'Nhập đường dẫn',
              buildInputText: BuildInputText(
                InputTextModel(controller: _urlTextCtrl),
              ),
            ),
            const SizedBox(height: 4),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Đường dẫn mặc định:',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextButton(
                  onPressed: _resetBaseUrl,
                  child: const Text(
                    'Đặt lại',
                    style: TextStyle(
                      color: AppColors.primaryColor,
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
            Text(
              _envConfig.baseUrl,
              maxLines: 3,
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
