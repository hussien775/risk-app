import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:risk/core/app_theme_widget.dart';
import 'package:risk/core/widget/navigateTo.dart';

class DontHaveAnAccountOrHaveAnAccountWidget extends StatelessWidget {
  final String textSpan1;
  final String textSpan2;
  final Widget widget;

  const DontHaveAnAccountOrHaveAnAccountWidget({
    super.key,
    required this.textSpan1,
    required this.textSpan2,
    required this.widget,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: textSpan1,
            style: TextStyle(
              color: Colors.grey[600],
              fontWeight: FontWeight.w500,
              fontSize: 13.sp,
              fontFamily: 'tajawal'
            ),
          ),
          TextSpan(
              text: textSpan2,
              style: TextStyle(
                color: primary,
                fontWeight: FontWeight.w600,
                fontSize: 13.sp,
                  fontFamily: 'tajawal'

              ),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  navigateTo(context, widget);
                }),
        ],
      ),
    );
  }
}
