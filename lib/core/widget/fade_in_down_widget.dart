import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

class FadeInDownWidget extends StatelessWidget {
  final Widget child;

  const FadeInDownWidget({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return FadeInDown(
      delay: const Duration(milliseconds: 400),
      duration: const Duration(milliseconds: 400),
      child: child,
    );
  }
}
