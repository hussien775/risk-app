import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:risk/core/widget/auto_size_text_widget.dart';

class DesignItemOfBuyAndSellWidget extends StatelessWidget {
   DesignItemOfBuyAndSellWidget({super.key,required this.describe,required this.title});
  String describe;
  String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 10.0.sp,left: 10.sp,right: 10.sp,bottom: 10.sp),
      child: Row(
        children: [
          AutoSizeTextWidget(text: title),
          const Spacer(),
          AutoSizeTextWidget(text: describe, notBoldFont: true),
        ],
      ),
    );
  }
}
