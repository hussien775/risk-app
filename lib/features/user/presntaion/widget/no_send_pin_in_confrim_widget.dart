import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:risk/core/app_theme_widget.dart';
import 'package:risk/core/widget/auto_size_text_widget.dart';

class NoSendPinOfConfrimWidget extends StatelessWidget {
  const NoSendPinOfConfrimWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        RichText(
          text: TextSpan(
            style:const TextStyle(
              fontFamily: 'tajawal'
            ),

            children: [
              TextSpan(
                text: "لم اتلق الرمز ( ",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                  fontSize: 14.sp,
                ),
              ),
              TextSpan(
                  text: "1:00",
                  style: TextStyle(
                    color: secondary,
                    fontWeight: FontWeight.w600,
                    fontSize: 14.sp,
                  ),

                  // recognizer: TapGestureRecognizer()
                  //   ..onTap = () {
                  //     navigateTo(context, widget);
                  //   }
                    ),
              TextSpan(
                text: " ) ؟",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                  fontSize: 14.sp,
                ),),

            ],
          ),
        ),
        7.verticalSpace,
        AutoSizeTextWidget(text: "اعادة الارسال",fontSize: 14,colorText: Colors.grey[500],)
      ],
    );
  }
}
