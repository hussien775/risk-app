import 'package:risk/core/app_theme_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoadingButtonWidget extends StatelessWidget {
  final Color? color;

  const LoadingButtonWidget({super.key, this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 45.h,
      decoration: BoxDecoration(
        color: color ?? primary,
        borderRadius: BorderRadius.circular(8.0.sp),
      ),
      alignment: Alignment.center,
      child: const CircularProgressIndicator(
        color: Colors.white,
      ),
    );
  }
}
