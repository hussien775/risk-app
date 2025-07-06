import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:risk/core/app_theme_widget.dart';
import 'package:risk/core/widget/auto_size_text_widget.dart';

import '../../../../generated/l10n.dart';


class ContainerOfMyShareAppBarWidget extends StatelessWidget {
 const ContainerOfMyShareAppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: 80.h,
          color: primary,
        ),
        Padding(
          padding:  EdgeInsets.only(
            left: 10.0.sp,
            right: 10.sp,
          ),
          child: Container(
            width: double.infinity,
            alignment: Alignment.center,
            height: 135.h,
            decoration: BoxDecoration(
              color: primary,
              border: Border.all(color: Colors.white, width: 8),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Padding(
              padding: EdgeInsets.only(left: 10.0.sp, right: 10.sp),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        AutoSizeTextWidget(
                          text: S.of(context).totalBalance,
                          colorText: Colors.white,
                          notBoldFont: true,
                        ),
                        const Spacer(),
                        Image(
                          image: const AssetImage("assest/images/Stroke.png"),
                          width: 35.w,
                          height: 35.h,
                        )
                      ],
                    ),
                    18.verticalSpace,
                    Row(
                      children: [
                        AutoSizeTextWidget(
                            text:S.of(context).totalBuyAmount,
                            fontSize: 18,
                            colorText: Colors.white),
                        const Spacer(),
                        AutoSizeTextWidget(
                            text: "-",
                            fontSize: 22,
                            colorText: Colors.white),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
