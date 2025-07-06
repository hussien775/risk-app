import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:risk/core/widget/auto_size_text_widget.dart';

import '../../../generated/l10n.dart';

class DesignOfCardOfWalletInHomeWidget extends StatelessWidget {
  const DesignOfCardOfWalletInHomeWidget({super.key,required this.color,required this.cash});
  final Color color;
  final int cash;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,

      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.sp),
        color: color

      ),
      child: Padding(
        padding:
        EdgeInsets.only(left: 13.0.sp, right: 13.sp),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  AutoSizeTextWidget(
                    text: S.of(context).cash,
                    colorText: Colors.white,
                    notBoldFont: false,
                    fontSize: 16.sp,
                  ),

                  const Spacer(),
                  Image(
                    image: const AssetImage(
                        "assest/images/Stroke.png"),
                    width: 30.w,
                    height: 30.h,
                  )
                ],
              ),
              13.verticalSpace,
              AutoSizeTextWidget(
                  text: cash.toString(),
                  fontSize: 25,
                  colorText: Colors.white),
            ],
          ),
        ),
      ),
    );
  }
}
