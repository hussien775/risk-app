import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:risk/core/widget/auto_size_text_widget.dart';
import '../../../../core/app_theme_widget.dart';
import '../../../../core/widget/desgin_of_icon_display_app_widget.dart';
import '../../../../generated/l10n.dart';

class RowOfMoneyAndAddBottonWidget extends StatelessWidget {
  const RowOfMoneyAndAddBottonWidget(
      {super.key,
      this.onTap,
      this.buttonDescribe,
      this.keyOfWidget,
      this.describeContainer,
      required this.money,
      required this.coin});

  final Function()? onTap;
  final GlobalKey? keyOfWidget;
  final String? describeContainer;
  final dynamic money;
  final String coin;
  final String? buttonDescribe;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            // child: Showcase(
            //   key: keyOfWidget!,
            //   description: describeContainer,
            //   tooltipBackgroundColor: const Color(0xffFFF8Ee),
              child: Row(
                // alignment: Alignment.centerLeft,
                children: [
                  Expanded(
                    child: Container(
                      height: 45.h,
                      alignment: Alignment.centerRight,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(right: 8.0.sp, left: 8.sp),
                        child: AutoSizeTextWidget(
                            text: " $coin " "$money", notBoldFont: true),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 8.0.sp, right: 8.sp),
                    child:
                        DesginOfIconDisplayAppWidget(keyOfWidget: keyOfWidget!),
                  ),
                ],
              ),
            ),
         // ),


          7.horizontalSpace,
          Container(
            width: 60.w,
            height: 45.h,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: primary,
              borderRadius: BorderRadius.circular(15),
            ),
            child: AutoSizeTextWidget(
                text: buttonDescribe ?? S.of(context).buttonAdd,
                colorText: Colors.white,
                centerText: true),
          ),
        ],
      ),
    );
  }
}
