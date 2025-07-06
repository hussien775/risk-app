import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:risk/core/app_theme_widget.dart';
import 'package:risk/core/widget/auto_size_text_widget.dart';

class ContainerOfShowDepositOrWithdrawProcessWidget extends StatelessWidget {
  const ContainerOfShowDepositOrWithdrawProcessWidget(
      {super.key,
      required this.isDeposit,
      this.amount,
      this.report,
       required this.numProcess,
      required this.dateTime});

  final bool isDeposit;
  final int? amount;
  final String? report;
  final DateTime? dateTime;
  final int? numProcess;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: EdgeInsets.all(10.0.sp),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  width: 44.w,
                  height: 44.h,
                  decoration: BoxDecoration(
                    color: const Color(0xffFFF8ED),
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Image.asset(
                    "assest/images/receipt-item.png",
                    color: secondary,
                  ),
                ),
                8.horizontalSpace,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AutoSizeTextWidget(text: " العملية $numProcess"),
                    5.verticalSpace,
                    AutoSizeTextWidget(
                        text: DateFormat('dd MMMM yyyy , h:mm a', )
                            .format(dateTime!),
                        notBoldFont: true),
                  ],
                ),
                // " 01 يناير 2024، 07:10 م"
                const Spacer(),
                AutoSizeTextWidget(
                  text: " $amount ر.ي ",
                  colorText: primary,
                ),
              ],
            ),
            8.verticalSpace,
            isDeposit == false
                ? 0.horizontalSpace
                : Row(
                    children: [
                      AutoSizeTextWidget(
                          text: "البيان :", colorText: Color(0xff627795)),
                      12.horizontalSpace,
                      AutoSizeTextWidget(text: report!),
                    ],
                  ),
          ],
        ),
      ),
    );
  }
}
