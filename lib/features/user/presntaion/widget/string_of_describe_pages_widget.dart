import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:risk/core/app_theme_widget.dart';
import 'package:risk/core/widget/auto_size_text_widget.dart';

class StringOfDescribePagesWidget extends StatelessWidget {
  const StringOfDescribePagesWidget({super.key,required this.title,required this.subTitle});
  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(left: 12.0.sp,right: 12.sp),
      child: Column(
        children: [
          AutoSizeTextWidget(text: title,colorText: primary,fontSize: 18,),
          7.verticalSpace,
          AutoSizeTextWidget(text: subTitle,colorText: Colors.grey[700],maxLines: 2,centerText: true,)
        ],
      ),
    );
  }
}
