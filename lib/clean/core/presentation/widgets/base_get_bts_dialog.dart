import 'package:get/get.dart';
import 'package:v_bhxh/clean/core/presentation/bindings/binding_src.dart';
import 'package:v_bhxh/clean/core/presentation/controllers/base_get_cl_controller.dart';
import 'package:v_bhxh/clean/core/presentation/widgets/get_page_mixin.dart';
import 'package:v_bhxh/clean/shared/utils/utils_src.dart';

/// Base page dùng chung cho bottom sheet và dialog
///
/// Thiết kế là các bts, dialog có thể mở nhiều lần đè lên nhau
/// và mỗi lần mở sẽ tạo một instance mới của controller.
///
/// => Dùng factory
abstract class BaseGetBtsDialog<T extends BaseGetClController>
    extends GetView<T> with GetPageMixin {
  BaseGetBtsDialog({super.key});

  @override
  T get controller => _controller;

  late final _controller = () {
    bindingFactory.dependencies();
    return Get.findFactory<T>();
  }();

  BaseBindingsFactory get bindingFactory;
}
