import 'package:flutter/material.dart';

class SDSSafearea extends StatelessWidget {
  final Widget child;
  const SDSSafearea({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: child,
    );
  }
}
