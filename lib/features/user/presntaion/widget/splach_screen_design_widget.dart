import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:risk/core/app_theme_widget.dart';

class SplachScreenDesignWidget extends StatelessWidget {
  final String image;
  final String title;
  final String title2;
  final String description;

  const SplachScreenDesignWidget({
    super.key,
    required this.image,
    required this.title2,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding:  EdgeInsets.only(top: 40.0.h),
          child: Container(
            width: 260.w,
            height: 210.h,
            decoration:  BoxDecoration(
              image: DecorationImage(
                image: AssetImage(image),
              ),
            ),
          ),
        ),

         SizedBox(
          height: 50.h,
        ),

        Padding(
          padding:  EdgeInsets.symmetric(horizontal: 15.0.sp),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AutoSizeText(
                title,
                style:  TextStyle(fontWeight: FontWeight.bold, ),
                maxLines: 1,
                maxFontSize: 20 ,
                minFontSize: 12 ,
              ),
              AutoSizeText(
                title2,
                style:  TextStyle(fontWeight: FontWeight.bold, color: primary),
                maxLines: 1,
                maxFontSize: 20 ,
                minFontSize: 12 ,
              ),

            ],
          ),
        ),

         SizedBox(
          height: 10.0.h,
        ),
        Expanded(
          child: Padding(
            padding:  EdgeInsets.symmetric(horizontal: 15.sp),
            child: Text(
              description,
              style: TextStyle(fontSize: 14.sp, color: const Color(0xff868f9f),fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ],
    );
  }
}
