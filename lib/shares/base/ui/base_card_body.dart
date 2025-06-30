import 'package:flutter/cupertino.dart';

import '../../../core/core.src.dart';

class BaseCardBody extends StatelessWidget {
  const BaseCardBody({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.primaryColor,
      child: Container(
        decoration: const BoxDecoration(
          color: AppColors.backgroundColorLight,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(AppDimens.radius36),
          ),
        ),
        child: child,
      ),
    );
  }
}
