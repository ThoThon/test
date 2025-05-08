import 'package:flutter/material.dart';

import '../../../assets.dart';
import '../../../core/core.src.dart';
import '../../shares.src.dart';

class BaseAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Widget? leading;
  final List<Widget>? actions;
  final VoidCallback? backFunc;
  const BaseAppBar({
    super.key,
    required this.title,
    this.leading,
    this.actions,
    this.backFunc,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      scrolledUnderElevation: 0,
      automaticallyImplyLeading: false,
      titleSpacing: 0,
      leading: leading ??
          IconButton(
            onPressed: backFunc ?? Get.back,
            icon: SDSImageSvg(
              Assets.ASSETS_ICONS_IC_ARROW_LARGE_SVG,
              width: AppDimens.sizeIconMedium,
              height: AppDimens.sizeIconMedium,
            ),
          ),
      title: TextUtils(
        text: title,
        availableStyle: StyleEnum.subBold,
      ),
      actions: actions,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
