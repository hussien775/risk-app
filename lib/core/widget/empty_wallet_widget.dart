import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:risk/core/widget/auto_size_text_widget.dart';
import 'default_button.dart';

class EmptyWalletWidget extends StatelessWidget {
  const EmptyWalletWidget({super.key, this.onPressed});

  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        color: const Color(0xffF6F7F9),
        width: double.infinity,
        height: 500.h,
        alignment: Alignment.center,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AutoSizeTextWidget(
              text: "لاتوجد لديك اي محافظ بعد ",
              fontSize: 16.sp,
              minFontSize: 10,
              maxFontSize: 20,
              maxLines: 1,
            ),
            SizedBox(
              height: 6.h,
            ),
            AutoSizeTextWidget(
              text: "قم باضافة المحفظة الخاصة بك",
              colorText: const Color(0xff868f9f),
              fontSize: 14.sp,
              minFontSize: 10,
              maxFontSize: 20,
              maxLines: 1,
            ),
            SizedBox(
              height: 12.h,
            ),
            DefaultButtonWidget(
              width: 120.w,
              textSize: 15.sp,
              text: "اضافة",
              onPressed: onPressed,
            )
          ],
        ),
      ),
    );
  }
}
