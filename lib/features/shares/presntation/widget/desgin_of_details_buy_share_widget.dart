import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:risk/features/shares/presntation/widget/design_item_of_by_and_sell_indecator_widget.dart';

import '../../../../generated/l10n.dart';

class DesignOfDetailsBuyShareWidget extends StatelessWidget {
  const DesignOfDetailsBuyShareWidget(
      {super.key,
      required this.dateBuy,
      required this.count,
        required this.avalibleCount,
      required this.unitAmount});

  final DateTime dateBuy;
  final int count;
  final int unitAmount;
  final int avalibleCount;
  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.passthrough,
      children: [
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10.sp),
          ),
          child: Column(
            children: [
              DesignItemOfBuyAndSellWidget(
                  title: S.of(context).buyDate,
                  describe: DateFormat('d MMMM yyyy', 'en').format(dateBuy)),
              const Divider(
                thickness: 0.3,
              ),
              DesignItemOfBuyAndSellWidget(
                  title: S.of(context).amountInTableShare,
                  describe: count.toString()),
              const Divider(
                thickness: 0.3,
              ),
              DesignItemOfBuyAndSellWidget(
                  title: S.of(context).buyPrice,
                  describe: unitAmount.toString()),
              const Divider(
                thickness: 0.3,
              ),
              DesignItemOfBuyAndSellWidget(
                  title: S.of(context).remainingQuantity, describe: avalibleCount.toString()),
            ],
          ),
        ),
      ],
    );
  }
}
