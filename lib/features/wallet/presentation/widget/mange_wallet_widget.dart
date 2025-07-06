import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:risk/core/widget/auto_size_text_widget.dart';
import 'package:risk/features/wallet/presentation/page/withdraw_process_page.dart';
import 'package:risk/features/wallet/presentation/widget/drop_down_of_rate_widget.dart';
import 'package:risk/features/wallet/presentation/widget/rate_of_risk_widget.dart';
import 'package:risk/features/wallet/presentation/widget/row_of_money_and_add_botton_widget.dart';
import '../../../../core/widget/navigateTo.dart';
import '../../../../generated/l10n.dart';
import '../../data/model/wallet_model.dart';
import '../page/deposit_process_page.dart';
import '../state_mangment/deposit_riverpod.dart';
import '../state_mangment/withdraw_riverpod.dart';

class MangeWalletWidget extends StatelessWidget {
  MangeWalletWidget({super.key, required this.walletData,required this.numWallet});

  final List<WalletData> walletData;
 final int numWallet;
  final List<GlobalKey>? keys = [
    GlobalKey(),
    GlobalKey(),
    GlobalKey(),
    GlobalKey(),
  ];

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {

        return walletData.isEmpty? SizedBox():Padding(
        padding: EdgeInsets.only(
            left: 15.0.sp, right: 15.sp, top: 20.sp, bottom: 22.sp),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AutoSizeTextWidget(text: S.of(context).investment),
            10.verticalSpace,
            RowOfMoneyAndAddBottonWidget(
              buttonDescribe: "ايداع",
              onTap: () {
                ref
                    .read(depositProvider.notifier)
                    .getDepositData(idWallet: walletData[numWallet].id!);
                navigateTo(
                    context,
                    DepositProcessPage(
                      idWallet:walletData[numWallet].id!,
                    ));
              },
              coin: walletData[numWallet].coin!,
              money: walletData[numWallet].total,
              describeContainer: "عدد الاسهم المسموح بالشراء من نسبة المخاطر",
              keyOfWidget: keys![0],
            ),
            10.verticalSpace,
            AutoSizeTextWidget(text: S.of(context).theTotalAmountWithdrawn),
            10.verticalSpace,
            RowOfMoneyAndAddBottonWidget(
                buttonDescribe: "سحب",
                describeContainer: "عدد الاسهم المسموح بالشراء من نسبة المخاطر",
                onTap: () {
                  ref
                      .read(withdrawProvider.notifier)
                      .getWithdrawData(idWallet: walletData[numWallet].id!);
                  navigateTo(
                    context,
                    WithdrawProcessPage(
                        idWallet: walletData[numWallet].id!),
                  );
                },
                coin: walletData[numWallet].coin!,
                money: walletData[numWallet].total! -
                    walletData[numWallet].cash!,
                keyOfWidget: keys![1]),
            10.verticalSpace,
            AutoSizeTextWidget(text: S.of(context).reserveAmountRatio),
            10.verticalSpace,
            RowOfMoneyAndAddBottonWidget(
              keyOfWidget: keys![2],
              describeContainer: "عدد الاسهم المسموح بالشراء من نسبة المخاطر",
              coin: walletData[numWallet].coin!,
              money: walletData[numWallet].spare,
            ),
            10.verticalSpace,
            AutoSizeTextWidget(text: S.of(context).riskRatio),
            10.verticalSpace,
            DropdownOfRateWidget(
              pageOfModelSheet: RateOfRuskWidget(),
              ratioText: walletData[numWallet].riskRatio!,
            ),
            10.verticalSpace,
            AutoSizeTextWidget(text: S.of(context).ratioOfTheTotalPortfolio),
            10.verticalSpace,
            DropdownOfRateWidget(
              pageOfModelSheet: RateOfRuskWidget(),
              ratioText: "-",
            ),
            20.verticalSpace,
          ],
        ),
      );
      },
    );
  }
}
