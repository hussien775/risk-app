import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:risk/core/widget/auto_size_text_widget.dart';
import 'package:risk/features/shares/data/model/shares_data.dart';
import 'package:risk/features/shares/presntation/widget/design_item_of_by_and_sell_indecator_widget.dart';

import '../../../../generated/l10n.dart';


class DesignBuyAndSellIndicatorsWidget extends StatelessWidget {
  const DesignBuyAndSellIndicatorsWidget({super.key,required this.sharesData});
  final SharesData sharesData;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AutoSizeTextWidget(text:S.of(context).buyAndSellIndicators,fontSize: 18,),
        12.verticalSpace,
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10.sp),
          ),
          child:  Column(
            children: [
              DesignItemOfBuyAndSellWidget(title: S.of(context).currentPriceOfTheShare,describe: "-"),
              const Divider(thickness: 0.3,),

              DesignItemOfBuyAndSellWidget(title: S.of(context).averageBuyingPrice,describe:sharesData.avgPayAmountShares.toString() ),
              const Divider(thickness: 0.3,),
              DesignItemOfBuyAndSellWidget(title: S.of(context).purchaseValueOfTheStock,describe:sharesData.avgPayAmountShares.toString()),
              const Divider(thickness: 0.3,),
              DesignItemOfBuyAndSellWidget(title: S.of(context).stopLossValue,describe:sharesData.stopLossValue.toString()),
              const Divider(thickness: 0.3,),
              DesignItemOfBuyAndSellWidget(title: S.of(context).profitValue,describe: sharesData.stopValueProfit.toString()),
              const Divider(thickness: 0.3,),
              DesignItemOfBuyAndSellWidget(title: S.of(context).riskRatio,describe: "-"),
              const Divider(thickness: 0.3,),
              DesignItemOfBuyAndSellWidget(title: S.of(context).returnOnRisk,describe: sharesData.returnFromRisk.toString()),
            ],
          ),
        ),
      ],
    );
  }
}
