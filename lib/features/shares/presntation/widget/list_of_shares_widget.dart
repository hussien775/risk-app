import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:risk/features/shares/data/model/shares_data.dart';
import 'container_of_my_share_widget.dart';

class ListOfSharesWidget extends StatelessWidget {
  const ListOfSharesWidget({super.key,required this.shares,required this.ratioSpare,
    required this.cash,});
  final List<SharesData> shares;
  final int cash;
  final int ratioSpare;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        index = shares.length - 1 - index;

        return Column(
          children: [
            ContainerOfMyShareWidget(
              idShare: shares[index].id!,
              nameShares: shares[index].name??"",
              amount:shares[index].avgPayAmountShares!,
              numberShares:  int.parse(shares[index].numPayShares!)-int.parse(shares[index].numSellShares!),
              lossOrProfit:shares[index].totalSaleProcess!-shares[index].totalBuyProcess! ,
              ratioSpare:ratioSpare,
              cash: cash,
            ),
            10.verticalSpace,
          ],
        );
      },
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: shares.length,
    );
  }
}
