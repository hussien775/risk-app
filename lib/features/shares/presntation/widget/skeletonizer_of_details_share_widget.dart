import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:risk/core/widget/skeletoizer_widget.dart';

import '../../data/model/shares_data.dart';
import 'container_financial_account_widget.dart';
import 'container_of_details_share_widget.dart';
import 'design_buy_and_sell_indicators_widget.dart';

class SkeletonizerOfDetailsShareWidget extends StatelessWidget {
  const SkeletonizerOfDetailsShareWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return  SkeletonizerWidget(
      child: Column(
        children: [
          ContainerDetailsShareWidget(
            sharesData:  SharesData.fakeSharesData[0],
          ),
          22.verticalSpace,
          ContainerOfFinancialAccountWidget(sharesData: SharesData.fakeSharesData[0],),
          22.verticalSpace,
          DesignBuyAndSellIndicatorsWidget(
            sharesData: SharesData.fakeSharesData[0],
          ),
        ],
      ),
    );
  }
}
