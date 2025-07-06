import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../app_theme_widget.dart';

class BackButtonWidget extends StatelessWidget {
  const BackButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.of(context).pop();
      },
      child:  Padding(
        padding: EdgeInsets.only(
            top: 20.0.sp, bottom: 18.sp, right: 10.sp,left: 10.sp),
        child: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
            decoration: BoxDecoration(
              color: const Color(0xffFFF8Ee),
              borderRadius: BorderRadius.circular(12.0.sp),
            ),
            alignment: Alignment.center,
            child: const Icon(
              Icons.arrow_back,
              size: 26,
              color: secondary,
            ),
          ),
        ),
      ),
    );
  }
}
