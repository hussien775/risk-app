import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:risk/core/app_theme_widget.dart';
import 'package:risk/core/widget/auto_size_text_widget.dart';

class ContainerOfShareInHomeWidget extends StatelessWidget {
  const ContainerOfShareInHomeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.0.sp),
      child: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AutoSizeTextWidget(
                text: "حسين",
                colorText: primary,
              ),
              8.verticalSpace,
              Row(
                children: [
                  Column(

                    children: [
                      AutoSizeTextWidget(
                          text: "اجمالي الاسهم",
                          colorText: Colors.grey[500],
                          maxFontSize: 20,
                          fontSize: 15),
                      8.verticalSpace,
                      AutoSizeTextWidget(
                        text: "20",
                        colorText: Colors.black,
                      ),
                    ],
                  ),
                  Spacer(),
                  Column(

                    children: [
                      AutoSizeTextWidget(
                        text: "السعر الحالي للسهم",
                        colorText: Colors.grey[500],
                        fontSize: 15,
                      ),
                      8.verticalSpace,
                      AutoSizeTextWidget(
                        text: "2658",
                        colorText: Colors.black,
                      ),
                    ],
                  ),
                  Spacer(),
                  Column(

                    children: [
                      AutoSizeTextWidget(
                        text: "نسبة الاسهم",
                        maxFontSize: 20,
                        colorText: Colors.grey[500],
                        fontSize: 15,
                      ),
                      8.verticalSpace,

                      AutoSizeTextWidget(
                        text: "0.12",
                        colorText: Color(0xff21BF73),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
