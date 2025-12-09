import 'package:flutter/material.dart';

class ResponsiveCenterContainer extends StatelessWidget {
  const ResponsiveCenterContainer({
    super.key,
    required this.child,
    this.maxWidth,
    this.maxHeight,
  });

  final Widget child;
  final double? maxWidth;
  final double? maxHeight;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: maxWidth ?? double.infinity,
          maxHeight: maxHeight ?? double.infinity,
        ),
        child: child,
      ),
    );
  }
}
