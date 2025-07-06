import 'package:flutter/material.dart';
import 'package:risk/core/app_theme_widget.dart';
import 'package:shimmer/shimmer.dart';


class ShimmerWidget extends StatelessWidget {
  final Widget child;
 final Color? baseColor;
 final Color? highlightColor;

 const ShimmerWidget({
    super.key,
    required this.child,
    this.baseColor,
    this.highlightColor,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: primary,
      highlightColor: Colors.white,
      direction: ShimmerDirection.ltr,
      period:const Duration(seconds: 4),
      child: child,
    );
  }
}
