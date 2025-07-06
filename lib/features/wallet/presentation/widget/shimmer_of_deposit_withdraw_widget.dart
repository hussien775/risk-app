import 'package:flutter/material.dart';
import '../../../../core/widget/skeletoizer_widget.dart';
import '../../../../core/widget/sliver_app_bar_widget.dart';
import '../../data/model/deposit_model.dart';
import 'container_of_withdraw_and_deposit_in_appbar_widget.dart';
import 'list_of_deposit_process_widget.dart';

class ShimmerOfDepositAndWithdrawWidget extends StatelessWidget {
  const ShimmerOfDepositAndWithdrawWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return  SkeletonizerWidget(
      child: Column(
        children: [
          SliverAppBarWidget(
            title: "",
            widget: ContainerOfDepositAndWithdrawWidget(
              isDeposit: true,
              cashInDeposit: DepositData.fakeDepositData,
              idWallet: 0,
            ),
            isSecondryPage: true,
          ),
          Flexible(
              child: ListOfDepositProcessWidget(
                  depositProcess: DepositData.fakeDepositData),),
        ],
      ),
    );
  }
}
