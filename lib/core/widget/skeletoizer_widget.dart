import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class SkeletonizerWidget extends StatelessWidget {
  const SkeletonizerWidget({super.key,required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
        effect:const ShimmerEffect.raw(colors: [
          Color(0x0A084FC5),
          Color(0x70F6F7F9),
          Color(0x0A084FC5),
        ],
            begin: Alignment.centerRight,
            end: Alignment.centerLeft,
            duration: Duration(seconds: 4),
            tileMode: TileMode.mirror

        ),
        child: child
    );
  }
}
