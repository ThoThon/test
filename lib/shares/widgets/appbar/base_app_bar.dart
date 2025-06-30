import '../../../modules/src.dart';

class BaseAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget? title;
  final Widget? leading;
  final bool? centerTitle;
  final List<Widget>? actions;
  final Color? backgroundColor;
  final IconThemeData? iconTheme;
  final VoidCallback? onTap;
  final Color? colorIconBack;

  const BaseAppBar({
    super.key,
    required this.title,
    this.leading,
    this.centerTitle,
    this.actions,
    this.backgroundColor,
    this.iconTheme,
    this.onTap,
    this.colorIconBack,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      scrolledUnderElevation: 0,
      backgroundColor: backgroundColor,
      titleSpacing: 0,
      leading: leading ??
          InkWell(
            onTap: onTap ?? Get.back,
            child: SDSImageSvg(
              Assets.ASSETS_ICONS_IC_ARROW_LEFT_SVG,
              fit: BoxFit.none,
              color: colorIconBack ?? AppColors.colorBlack,
            ),
          ),
      title: title,
      centerTitle: centerTitle,
      actions: actions,
      iconTheme: iconTheme,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
