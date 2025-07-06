import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:risk/core/widget/auto_size_text_widget.dart';
import 'package:risk/core/widget/default_button.dart';
import 'package:risk/core/widget/navigateTo.dart';
import 'package:risk/features/shares/presntation/page/add_share_page.dart';
import 'package:risk/features/wallet/data/model/wallet_model.dart';
import '../../../../generated/l10n.dart';
import 'list_of_shares_widget.dart';

class MyShareWidget extends StatelessWidget {
  const MyShareWidget(
      {super.key, required this.shares, required this.numberWallet});

  final int numberWallet;
  final List<WalletData> shares;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          left: 15.0.sp, right: 15.sp, top: 10.sp, bottom: 22.sp),
      child: Column(
        children: [
          Row(
            children: [
              AutoSizeTextWidget(
                text: S.of(context).myShares,
                fontSize: 18.sp,
              ),
              const Spacer(),
              DefaultButtonWidget(
                text: S.of(context).buttonAdd,
                width: 70.w,
                height: 45.h,
                onPressed: () {
                  navigateTo(
                      context,
                      AddSharePage(
                        withdrawalAmount: shares[numberWallet].withdrawSumAmount!,
                        investmentAmount: shares[numberWallet].total!,
                        cash: shares[numberWallet].cash!,
                        idWallet: shares[numberWallet].id!,
                      ));
                },
              ),
            ],
          ),
          shares.isEmpty
              ? SizedBox()
              : ListOfSharesWidget(
                  shares: shares[numberWallet].shares ?? [],
            cash: shares[numberWallet].cash!,
            ratioSpare:int.parse(shares[numberWallet].ratioSpare!),
                ),
        ],
      ),
    );
  }
}
