import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:risk/core/app_theme_widget.dart';
import 'package:risk/core/widget/auto_size_text_widget.dart';
import '../../../../generated/l10n.dart';

class ContainerOfCashInMangeWalletAppBarWidget extends StatelessWidget {
  const ContainerOfCashInMangeWalletAppBarWidget(
      {super.key, required this.cash,required this.numWallet});

 final dynamic  cash;
 final int numWallet;
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
          padding: EdgeInsets.only(
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
              padding: EdgeInsets.only(left: 13.0.sp, right: 13.sp),
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
                          image: const AssetImage("assest/images/Stroke.png"),
                          width: 30.w,
                          height: 30.h,
                        )
                      ],
                    ),
                    13.verticalSpace,
                    AutoSizeTextWidget(
                        text:cash.isEmpty?""  :cash[numWallet].cash!.toString(),
                        fontSize: 25,
                        colorText: Colors.white),
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
