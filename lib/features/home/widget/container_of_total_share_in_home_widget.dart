import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:risk/core/widget/auto_size_text_widget.dart';

import '../../../core/widget/spark_line_chart_widget.dart';


class ContainerOfTotalShareInHomeWidget extends StatelessWidget {
  const ContainerOfTotalShareInHomeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5.sp),
            ),
            child: Column(
              children: [
                6.verticalSpace,
                AutoSizeTextWidget(
                  text: "خسارتي",
                  colorText: const Color(0xffDD4B4B),
                ),
                4.verticalSpace,
                AutoSizeTextWidget(
                  text: "80",
                ),
                4.verticalSpace,
                SparklineChart( color: Colors.redAccent,),

              ],
            ),
          ),
        ),
        5.horizontalSpace,
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5.sp),
            ),
            child: Column(
              children: [
                6.verticalSpace,

                AutoSizeTextWidget(
                  text:" ارباحي",
                  colorText: const Color(0xff5ED5A8),
                ),
                4.verticalSpace,
                AutoSizeTextWidget(
                  text: "480",

                ),
                4.verticalSpace,
                SparklineChart( color: Colors.greenAccent,),
              ],
            ),
          ),
        ),
        5.horizontalSpace,
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5.sp),
            ),
            child: Column(
              children: [
                10.verticalSpace,
                AutoSizeTextWidget(
                  text:"الارباح/الخسارة الغير محققه",
                  colorText: const Color(0xff5ED5A8),
                ),
                10.verticalSpace,
                AutoSizeTextWidget(
                  text: "880",
                ),
                6.verticalSpace,
                // Image.asset("assest/images/total_share.png",
                //     fit: BoxFit.none, color: const Color(0xff5ED5A8)),
                AutoSizeTextWidget(
                  text:"+0.07%",
                  colorText: const Color(0xff5ED5A8),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
