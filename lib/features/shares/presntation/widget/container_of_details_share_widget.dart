import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:risk/core/widget/auto_size_text_widget.dart';

import '../../../../core/widget/spark_line_chart_widget.dart';
import '../../../../generated/l10n.dart';
import '../../data/model/shares_data.dart';


class ContainerDetailsShareWidget extends StatelessWidget {
  const ContainerDetailsShareWidget({super.key,required this.sharesData});
  final SharesData sharesData;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AutoSizeTextWidget(text: S.of(context).myShares,fontSize: 18),
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
                    5.verticalSpace,
                    AutoSizeTextWidget(
                      text: S.of(context).totalShare,
                      notBoldFont: true,
                    ),
                    5.verticalSpace,
                    AutoSizeTextWidget(
                      text:sharesData.numPayShares!
                    ),
                    5.verticalSpace,
                    SparklineChart(color: Colors.redAccent,),
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
                      text: "اسهمي الحالية",
                      notBoldFont: true,
                    ),
                    5.verticalSpace,
                    AutoSizeTextWidget(
                      text: (int.parse(sharesData.numPayShares!)-int.parse(sharesData.numSellShares!)).toString(),
                    ),
                    5.verticalSpace,
                    SparklineChart(color: Colors.greenAccent,),
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
                      text: "اسهمي المباعة",
                      notBoldFont: true,
                    ),
                    5.verticalSpace,
                    AutoSizeTextWidget(
                      text: sharesData.numSellShares!,
                    ),
                    5.verticalSpace,
                    SparklineChart(color: Colors.greenAccent,),

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
