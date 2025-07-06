import 'package:flutter/material.dart';

class DefaultContainerWidget extends StatelessWidget {
  const DefaultContainerWidget({super.key,this.radius,required this.child});
  final double? radius;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color:const Color(0xffFFF8ED),
        borderRadius: BorderRadius.circular(radius??0),
      ),
      child: child,

    );
  }
}
