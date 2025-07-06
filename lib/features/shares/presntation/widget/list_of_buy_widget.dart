import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:risk/features/shares/data/model/pay_sell_data.dart';
import 'package:risk/features/wallet/data/model/deposit_model.dart';
import 'package:risk/features/wallet/presentation/widget/container_of_show_deposit_or_withdraw_process_widget.dart';

import 'desgin_of_details_buy_share_widget.dart';
import 'design_of_details_sell_share_widget.dart';

class ListOfBuyWidget extends StatelessWidget {
  const ListOfBuyWidget({super.key, required this.buyData});

  final List<PaySellData> buyData;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        index = buyData.length - 1 - index;

        return Column(
          children: [
            DesignOfDetailsBuyShareWidget(
              unitAmount: buyData[index].unitAmount!,
              count: buyData[index].count!,
              dateBuy:DateTime.parse(buyData[index].dateBuy!,) ,
              avalibleCount: buyData[index].avaliableCount! ,

            ),
            7.verticalSpace,
          ],
        );
      },
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: buyData.length,
    );
  }
}
