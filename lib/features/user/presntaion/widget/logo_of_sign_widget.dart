import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LogoOfSignWidget extends StatelessWidget {
  const LogoOfSignWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // return Container(
    //   height: 100.h,
    //   width: 100.w,
    //   decoration: const BoxDecoration(
    //    // color: Colors.red,
    //     image: DecorationImage(
    //       image: AssetImage(
    //         "assest/images/Group.png",
    //       ),
    //       fit: BoxFit.contain
    //     ),
    //   ),
    // );
    return Column(
      children: [
        Image(
            image:const AssetImage(
          "assest/images/logo_dark.png",
        ),
          fit: BoxFit.contain,
          width: 120.w,
        ),
        10.verticalSpace,
      ],
    );
  }
}
