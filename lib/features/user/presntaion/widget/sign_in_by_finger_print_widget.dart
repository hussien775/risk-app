import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/widget/auto_size_text_widget.dart';

  class SignInByFingerPrintWidget extends StatelessWidget {
  const SignInByFingerPrintWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            const Expanded(
                child: Divider(
              thickness: 1.5,
            )),
            AutoSizeTextWidget(text: " او استخدم بصمة الاصبع ", notBoldFont: true),
            const Expanded(
                child: Divider(
              thickness: 1.5,
            )),
          ],
        ),
        20.verticalSpace,
        Container(
          width: 60.w,
          height: 50.h,
          decoration:  BoxDecoration(
            color:const Color(0xffEDF9FF),
            border: Border.all(color:const Color(0xff0063F5) ),
            borderRadius: BorderRadius.all(Radius.circular(15.sp)),
          ),
          child: Image(
            fit: BoxFit.contain,
            image: AssetImage("assest/images/fingerprint.png"),
          ),
        ),
      ],
    );
  }
}
