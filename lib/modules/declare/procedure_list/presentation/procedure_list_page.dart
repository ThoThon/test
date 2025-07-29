import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:v_bhxh/assets.dart';
import 'package:v_bhxh/clean/core/presentation/widgets/widget_src.dart';
import 'package:v_bhxh/clean/routes/app_routes_cl.dart';
import 'package:v_bhxh/core/const/app_text_style.dart';
import 'package:v_bhxh/core/theme/colors.dart';
import 'package:v_bhxh/core/values/dimens.dart';
import 'package:v_bhxh/generated/locales.g.dart';
import 'package:v_bhxh/modules/declare/procedure_list/domain/entity/entity_src.dart';
import 'package:v_bhxh/modules/declare/procedure_list/presentation/controller/procedure_list_controller.dart';
import 'package:v_bhxh/shares/base/ui/base_card_body.dart';
import 'package:v_bhxh/shares/base/ui/text_widget.dart';
import 'package:v_bhxh/shares/widgets/appbar/base_app_bar.dart';
import 'package:v_bhxh/shares/widgets/appbar/base_app_bar_title.dart';
import 'package:v_bhxh/shares/widgets/image_app/sds_image_svg.dart';
import 'package:v_bhxh/shares/widgets/sized_box/sized_box.dart';
import 'package:v_bhxh/shares/widgets/utils_widget/utils_widget.dart';

part 'procedure_list_widget.dart';

class ProcedureListPage extends BaseGetPage<ProcedureListController> {
  ProcedureListPage({super.key});

  @override
  Widget buildPage(BuildContext context) {
    return Container(
      color: AppColors.primaryColor,
      child: Scaffold(
        appBar: BaseAppBar(
          title: BaseAppBarTitle(
              title: LocaleKeys.procedureList_pageTitle.tr,
              textColor: AppColors.basicWhite),
          centerTitle: true,
          leading: UtilWidget.buildButtonBackAppbar(
            color: AppColors.basicWhite,
          ),
          backgroundColor: AppColors.primaryColor,
        ),
        body: BaseCardBody(
          child: SafeArea(
            child: _buildBody(),
          ),
        ),
      ),
    );
  }
}
