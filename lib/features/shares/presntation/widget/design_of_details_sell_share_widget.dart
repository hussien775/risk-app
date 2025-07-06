import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:risk/core/app_theme_widget.dart';
import 'package:risk/features/shares/presntation/widget/design_item_of_by_and_sell_indecator_widget.dart';

import '../../../../generated/l10n.dart';

class DesignOfDetailsSellShareWidget extends StatefulWidget {
  const DesignOfDetailsSellShareWidget(
      {super.key,
      required this.count,
      required this.unitAmount,
        required this.period,
        required this.dateBuy,
        required this.amountLossOrProfit,
        required this.rateLossOrProfit,
      required this.dateSale});

  final DateTime dateSale;
  final DateTime dateBuy;
  final int count;
  final int unitAmount;
  final int period;
  final  int amountLossOrProfit ;
  final  String rateLossOrProfit ;






  @override
  State<DesignOfDetailsSellShareWidget> createState() =>
      _DesignOfDetailsSellShareWidgetState();
}

class _DesignOfDetailsSellShareWidgetState
    extends State<DesignOfDetailsSellShareWidget> {
  bool showMore = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomLeft,
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
                  describe:
                      DateFormat('d MMMM yyyy', 'en').format(widget.dateBuy)),
              const Divider(
                thickness: 0.3,
              ),
              DesignItemOfBuyAndSellWidget(
                  title: S.of(context).saleDate,
                  describe:  DateFormat('d MMMM yyyy', 'en').format(widget.dateSale)),
              const Divider(
                thickness: 0.3,
              ),
              DesignItemOfBuyAndSellWidget(
                  title: S.of(context).period, describe:widget.period.toString() ),
              const Divider(
                thickness: 0.3,
              ),
              GestureDetector(
                  onTap: () {
                    setState(() {
                      showMore = true;
                    });
                  },
                  child: DesignItemOfBuyAndSellWidget(
                      title: S.of(context).amountInTableShare, describe: widget.count.toString())),
              showMore == false
                  ? SizedBox(
                      height: 18.h,
                    )
                  : Column(
                      children: [
                        const Divider(
                          thickness: 0.3,
                        ),
                        DesignItemOfBuyAndSellWidget(
                            title: S.of(context).marketValueSellingPrice,
                            describe: widget.unitAmount.toString()),
                        const Divider(
                          thickness: 0.3,
                        ),
                        DesignItemOfBuyAndSellWidget(
                            title: S.of(context).profitDividedLossAmount,
                            describe:widget.amountLossOrProfit.toString()),
                        const Divider(
                          thickness: 0.3,
                        ),
                        DesignItemOfBuyAndSellWidget(
                            title: S.of(context).profitDividedLossRatio,
                            describe: widget.rateLossOrProfit),
                        const Divider(
                          thickness: 0.3,
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              showMore = false;
                            });
                          },
                          child: DesignItemOfBuyAndSellWidget(
                              title: S.of(context).profitRatioFromPortfolio,
                              describe: "-"),
                        ),
                        15.verticalSpace,
                      ],
                    ),
            ],
          ),
        ),

        Container(
          color: const Color(0xffF6F7F9),
          height: 10.h,
          alignment: const AlignmentDirectional(1, 1),
        ),
        Positioned(
          bottom: -0.1,
          left: 19,
          child: GestureDetector(
            onTap: () {
              setState(() {
                showMore = !showMore;
              });
            },
            child: CircleAvatar(
              radius: 13,
              backgroundColor: const Color(0xffFEDCAA),
              child: Icon(
                  showMore == false
                      ? Icons.keyboard_arrow_down_rounded
                      : Icons.keyboard_arrow_up_rounded,
                  color: secondary),
            ),
          ),
        ),
        // Positioned(
        //   bottom: -10,
        //   left: 20,
        //   child: Container(
        //     color: Colors.red,
        //     width: 50,
        //     height: 70.h,
        //   ),
        // ),
      ],
    );
  }
}
