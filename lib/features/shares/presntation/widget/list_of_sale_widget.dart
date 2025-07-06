import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:risk/features/shares/data/model/pay_sell_data.dart';
import 'design_of_details_sell_share_widget.dart';

class ListOfSaleWidget extends StatelessWidget {
  const ListOfSaleWidget({super.key, required this.saleData});

  final List<PaySellData> saleData;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        index = saleData.length - 1 - index;

        return Column(
          children: [
            DesignOfDetailsSellShareWidget(
              unitAmount: saleData[index].unitAmount!,
              count: saleData[index].count!,
              dateBuy:DateTime.parse(saleData[index].dateBuy!,),
              dateSale: DateTime.parse(saleData[index].dateSale!,),
              amountLossOrProfit: saleData[index].profitOrLossAmount!,
              period: saleData[index].period!,
              rateLossOrProfit:  saleData[index].profitOrLossRate!,


            ),
            7.verticalSpace,
          ],
        );
      },
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: saleData.length,
    );
  }
}
