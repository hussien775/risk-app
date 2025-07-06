import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:risk/core/app_theme_widget.dart';

import '../../../../core/widget/default_button.dart';

class AddFingerPrintWidget extends StatelessWidget {
  AddFingerPrintWidget({super.key});
  TextEditingController email = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.all( 12.0.sp),
      child: Column(
        children: [
          25.verticalSpace,
          CircleAvatar(
            radius: 60,
            backgroundColor: const Color(0xffEDF9FF),
            child: SizedBox(
              width: 75.w,
              height: 75.h,
              child:const Image(
                fit: BoxFit.contain,
                image: AssetImage("assest/images/fingerprint.png"),
              ),
            ),
          ),


          60.verticalSpace,

          Row(
            children: [
              Expanded(
                child: DefaultButtonWidget(
                  text: "اضافة البصمة",
                  textSize: 15,
                  onPressed: (){
                 //   navigateTo(context,const ConfrimSignPage());
                  },
                ),
              ),
              12.horizontalSpace,
              Expanded(
                child: DefaultButtonWidget(
                  text: "تخطي",
                  textSize: 15,

                  background: Colors.transparent,
                  textColor: primary,
                  onPressed: (){
                 //   navigateTo(context,const ConfrimSignPage());
                  },
                ),
              ),
            ],
          ),

        ],
      ),
    );
  }
}
