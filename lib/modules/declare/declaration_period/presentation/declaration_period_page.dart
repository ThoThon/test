import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:v_bhxh/assets.dart';
import 'package:v_bhxh/clean/core/presentation/widgets/widget_src.dart';
import 'package:v_bhxh/core/const/app_text_style.dart';
import 'package:v_bhxh/core/theme/colors.dart';
import 'package:v_bhxh/core/values/dimens.dart';
import 'package:v_bhxh/generated/locales.g.dart';
import 'package:v_bhxh/modules/declare/declaration_period/domain/entity/entity_src.dart';
import 'package:v_bhxh/modules/declare/declaration_period/model/declaration_period_filter.dart';
import 'package:v_bhxh/modules/declare/declaration_period/presentation/controller/declaration_period_controller.dart';
import 'package:v_bhxh/shares/base/ui/base_card_body.dart';
import 'package:v_bhxh/shares/base/ui/text_widget.dart';
import 'package:v_bhxh/shares/date/date_utils.dart';
import 'package:v_bhxh/shares/widgets/appbar/base_app_bar.dart';
import 'package:v_bhxh/shares/widgets/appbar/base_app_bar_title.dart';
import 'package:v_bhxh/shares/widgets/image_app/sds_image_svg.dart';
import 'package:v_bhxh/shares/widgets/sized_box/sized_box.dart';
import 'package:v_bhxh/shares/widgets/utils_widget/utils_widget.dart';

part 'declaration_period_widget.dart';

class DeclarationPeriodPage extends BaseGetPage<DeclarationPeriodController> {
  DeclarationPeriodPage({super.key});

  @override
  Widget buildPage(BuildContext context) {
    return Container(
      color: AppColors.primaryColor,
      child: Scaffold(
        appBar: BaseAppBar(
          backgroundColor: AppColors.primaryColor,
          title: BaseAppBarTitle(
            title: LocaleKeys.declarationPeriod_title.tr,
            textColor: AppColors.basicWhite,
          ),
          centerTitle: true,
          leading: UtilWidget.buildButtonBackAppbar(
            color: AppColors.basicWhite,
          ),
          actions: [
            GestureDetector(
              child: SDSImageSvg(Assets.ASSETS_ICONS_IC_FILTER_PERIOD_SVG),
              onTap: () {
                Get.bottomSheet(
                  _buildFilterPeriod(),
                );
              },
            ),
            sdsSBWidth16,
          ],
        ),
        body: BaseCardBody(
          child: _buildBody(),
        ),
      ),
    );
  }
}
