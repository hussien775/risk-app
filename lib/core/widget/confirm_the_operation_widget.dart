import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:risk/core/app_theme_widget.dart';
import 'package:risk/core/widget/auto_size_text_widget.dart';
import 'package:risk/core/widget/default_button.dart';

// ignore: must_be_immutable
class ConfirmTheOperationWidget extends StatelessWidget {
  final Widget confirmButton;
  Widget? consumerPage;
  bool? isConsumerPage = false;
  final String text1;
  final String text2;
  String? text3 = "";
  bool? isRisk = false;
  bool? isCircleAvatar = false;
  double? height;
  Color? text3Color;

  ConfirmTheOperationWidget({
    super.key,
    required this.confirmButton,
    required this.text1,
    required this.text2,
    this.text3,
    this.consumerPage,
    this.isRisk,
    this.isCircleAvatar,
    this.isConsumerPage,
    this.height,
    this.text3Color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? 300.h,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18.sp),
      ),
      padding: EdgeInsets.all(15.sp),
      child: Column(
        children: [
          Expanded(
            child: Column(
              children: [
                isCircleAvatar == false
                    ? SizedBox(
                        width: 0.w,
                      )
                    : Expanded(
                        child: CircleAvatar(
                          backgroundColor:
                              isRisk == false ? secondary : Colors.red.shade50,
                          radius: 35.sp,
                          child: Icon(
                            Icons.warning_amber_sharp,
                            color: isRisk == false ? primary : Colors.redAccent,
                            size: 30.sp,
                          ),
                        ),
                      ),
                SizedBox(height: 16.h),
                AutoSizeTextWidget(
                  text: text1,
                  fontSize: 18.sp,
                ),
                SizedBox(height: 12.h),
                AutoSizeTextWidget(
                  text: text2,
                  colorText: secondary2,
                  maxLines: 20,
                ),
                SizedBox(height: 8.h),
                AutoSizeTextWidget(
                  text: text3??"",
                  colorText: text3Color ?? secondary2,
                  fontSize: 13.sp,
                  maxLines: 20,
                  centerText: true,
                ),
              ],
            ),
          ),
          SizedBox(height: 18.h),
          Row(
            children: [
              Expanded(
                child: confirmButton,
              ),
              SizedBox(
                width: 15.w,
              ),
              Expanded(
                child: DefaultButtonWidget(
                  height: 45.h,
                  background: isRisk == false ? secondary : secondary2,
                  text: "تراجع",
                  textColor: isRisk == false ? primary : secondary2,
                  textSize: 15.sp,
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ),
            ],
          ),

          /// Class Consumer Page
          isConsumerPage == false
              ? SizedBox(
                  width: 0.w,
                )
              : consumerPage!,
        ],
      ),
    );
  }
}
