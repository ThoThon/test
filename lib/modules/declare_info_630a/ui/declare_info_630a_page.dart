// import 'package:flutter_form_registry/flutter_form_registry.dart';
// import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
// import 'package:multi_select_flutter/multi_select_flutter.dart';
// import 'package:v_bhxh/clean/shared/entity/categories_630/categories_630_src.dart';
// import 'package:v_bhxh/modules/src.dart';
// import 'package:v_bhxh/shares/utils/utils_src.dart';

// import '../../../base_app/model/app_data.dart';
// import '../../../clean/shared/entity/category.dart';
// import '../../../shares/widgets/keyboard/keyboard.dart';

// part 'benefit_account_info_group_ext.dart';
// part 'declare_info_630a_widget.dart';
// part 'declare_info_group_ext.dart';
// part 'person_info_group_ext.dart';

// class DeclareInfo630aPage extends BaseGetWidget {
//   DeclareInfo630aPage({super.key});

//   @override
//   DeclareInfo630aController get controller => _controller;

//   late final _controller = Get.put(DeclareInfo630aController());

//   @override
//   Widget buildWidgets(BuildContext context) {
//     return buildLoadingOverlay(
//       () => Scaffold(
//         appBar: BaseAppBar(
//           title: BaseAppBarTitle(
//             title: controller.argument.procedureType.declareInfoTitle,
//           ),
//           leading: UtilWidget.buildButtonBackAppbar(),
//           centerTitle: true,
//         ),
//         body: SafeArea(
//           child: _buildBody(),
//         ),
//       ),
//     );
//   }
// }
