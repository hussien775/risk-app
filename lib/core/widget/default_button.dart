import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../app_theme_widget.dart';

class DefaultButtonWidget extends StatelessWidget {
  final double? width;
  final double? height;
  final Color? background;
  final Function()? onPressed;
  final String text;
  final double? textSize;
  final Color? textColor;
  final double? borderRadius;
  final double? maxFontSize;
  final double? minFontSize;

  const DefaultButtonWidget({
    super.key,
    this.width,
    this.height,
    this.background,
    this.onPressed,
    required this.text,
    this.textColor,
    this.textSize,
    this.borderRadius,
    this.maxFontSize,
    this.minFontSize,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? double.infinity,
      height: height ?? 45.h,
      decoration: BoxDecoration(
        color: background ?? primary,
        borderRadius: BorderRadius.circular(borderRadius ?? 8.0.sp),
        border: Border.all(color: primary),
      ),
      child: Center(
        child: MaterialButton(
          height: height ?? 45.h,
          minWidth: double.infinity,
          onPressed: onPressed,
          child: AutoSizeText(
            maxFontSize: maxFontSize ?? 25,
            minFontSize: minFontSize ?? 8,

            text,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: textSize ?? 14.sp,
              color: textColor ?? Colors.white,
            ),
            textAlign: TextAlign.center,
            maxLines: 1,
          ),
        ),
      ),
    );
  }
}
