import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:risk/core/widget/auto_size_text_widget.dart';

import '../../../../core/strings/equation.dart';
import '../../../../core/widget/spark_line_chart_widget.dart';
import '../../../../generated/l10n.dart';
import '../../data/model/shares_data.dart';

class ContainerOfFinancialAccountWidget extends StatelessWidget {
  const ContainerOfFinancialAccountWidget(
      {super.key, required this.sharesData});

  final SharesData sharesData;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AutoSizeTextWidget(text: S.of(context).financialAccount, fontSize: 18),
        12.verticalSpace,
        Row(
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.sp),
                ),
                child: Column(
                  children: [
                    12.verticalSpace,
                    AutoSizeTextWidget(
                      text: S.of(context).buy,
                      notBoldFont: true,
                    ),
                    12.verticalSpace,
                    AutoSizeTextWidget(
                      text: sharesData.totalBuyProcess.toString(),
                    ),
                    12.verticalSpace,
                  ],
                ),
              ),
            ),
            5.horizontalSpace,
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.sp),
                ),
                child: Column(
                  children: [
                    12.verticalSpace,
                    AutoSizeTextWidget(
                      text: S.of(context).sale,
                      notBoldFont: true,
                    ),
                    12.verticalSpace,
                    AutoSizeTextWidget(
                      text: sharesData.totalSaleProcess.toString(),
                      fontSize: 18,
                    ),
                    12.verticalSpace,
                  ],
                ),
              ),
            ),
            5.horizontalSpace,
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.sp),
                ),
                child: Column(
                  children: [
                    5.verticalSpace,
                    AutoSizeTextWidget(
                      text: profitOrLoss(sharesData.totalBuyProcess!,
                                  sharesData.totalSaleProcess!) >=
                              0
                          ? S.of(context).profitInTableShare
                          : "الخسارة",
                      notBoldFont: true,
                    ),
                    5.verticalSpace,
                    AutoSizeTextWidget(
                      text: profitOrLoss(sharesData.totalBuyProcess!,
                              sharesData.totalSaleProcess!)
                          .toString(),
                    ),
                    5.verticalSpace,
                    Visibility(
                      visible: profitOrLoss(sharesData.totalBuyProcess!,
                          sharesData.totalSaleProcess!) >=
                          0 ,
                      child: SparklineChart(
                        color: Colors.greenAccent,
                      ),
                      replacement: SparklineChart(color: Colors.redAccent,),
                    ),

                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
