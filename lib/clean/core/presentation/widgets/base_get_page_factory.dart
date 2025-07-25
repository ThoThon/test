import 'package:get/get.dart';
import 'package:v_bhxh/clean/core/presentation/controllers/base_get_cl_controller.dart';
import 'package:v_bhxh/clean/core/presentation/widgets/get_page_mixin.dart';

abstract class BaseGetPageFactory<T extends BaseGetClController>
    extends GetView<T> with GetPageMixin {
  BaseGetPageFactory({super.key});

  @override
  final isFactory = true;
}
