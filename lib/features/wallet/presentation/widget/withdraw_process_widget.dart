import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:risk/features/wallet/data/model/withdraw_model.dart';
import 'package:risk/features/wallet/presentation/widget/container_of_show_deposit_or_withdraw_process_widget.dart';
class ListWithdrawProcessWidget extends StatelessWidget {
  const ListWithdrawProcessWidget({super.key, required this.withdrawProcess});

  final List<WithdrawData> withdrawProcess;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        index = withdrawProcess.length - 1 - index;

        return Column(
          children: [
            ContainerOfShowDepositOrWithdrawProcessWidget(
              isDeposit: true,
              amount: withdrawProcess[index].amount,
              report: withdrawProcess[index].report,
              dateTime: DateTime.parse(withdrawProcess[index].date!),
              numProcess: withdrawProcess[index].id,
            ),
            7.verticalSpace,
          ],
        );
      },
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: withdrawProcess.length,
    );

  }
}

