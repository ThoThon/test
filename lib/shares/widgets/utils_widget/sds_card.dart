import 'package:flutter/material.dart';

class SDSCard extends StatelessWidget {
  final Widget child;
  final double borderRadius;
  final Color? color;

  const SDSCard({
    super.key,
    required this.child,
    this.borderRadius = 12,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: color ?? Colors.white,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: child,
    );
  }
}
