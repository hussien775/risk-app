import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:risk/features/wallet/data/model/deposit_model.dart';
import 'package:risk/features/wallet/presentation/widget/container_of_show_deposit_or_withdraw_process_widget.dart';

class ListOfDepositProcessWidget extends StatelessWidget {
  const ListOfDepositProcessWidget({super.key, required this.depositProcess});

  final List<DepositData> depositProcess;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        index = depositProcess.length - 1 - index;

        return Column(
          children: [
            ContainerOfShowDepositOrWithdrawProcessWidget(
              isDeposit: false,
              amount: depositProcess[index].amount,
              dateTime: DateTime.parse(depositProcess[index].date!),
              numProcess: depositProcess[index].id,
            ),
            7.verticalSpace,
          ],
        );
      },
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: depositProcess.length,
    );
  }
}
