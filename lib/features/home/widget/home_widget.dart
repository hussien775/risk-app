import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:risk/core/widget/auto_size_text_widget.dart';
import 'package:risk/core/widget/default_button.dart';
import 'package:risk/features/wallet/presentation/page/mange_wallet_page.dart';
import 'package:risk/features/wallet/presentation/state_mangment/mange_wallet_riverpod.dart';
import '../../../core/widget/navigateTo.dart';
import '../../../generated/l10n.dart';
import '../../shares/presntation/page/add_share_page.dart';
import '../../shares/presntation/widget/list_of_shares_widget.dart';
import '../../wallet/data/model/wallet_model.dart';
import '../../wallet/presentation/page/add_wallet_page.dart';
import 'list_of_card_of_wallet_in_home_widget.dart';
import 'container_of_total_share_in_home_widget.dart';

class HomeWidget extends ConsumerWidget {
  const HomeWidget({super.key, required this.listWallet});

  final List<WalletData> listWallet;

  @override
  Widget build(BuildContext context,ref) {
    return Column(
      children: [
        20.verticalSpace,
        ListOfCardOfWalletInHomeWidget(
          listWallet: listWallet,
        ),
        Padding(
          padding: EdgeInsets.only(left: 15.sp, right: 15.sp, bottom: 20.sp),
          child: Column(
            children: [
              50.verticalSpace,
              const ContainerOfTotalShareInHomeWidget(),
              10.verticalSpace,
              Row(
                children: [
                  AutoSizeTextWidget(
                      text: S.of(context).myShares, fontSize: 18.sp),
                  const Spacer(),
                  DefaultButtonWidget(
                    text: S.of(context).buttonAdd,
                    width: 70.w,
                    height: 45.h,
                    onPressed: () {
                       navigateTo(context, AddSharePage(
                         withdrawalAmount:listWallet[ref
                             .watch(changeWalletProviders.notifier)
                             .numWallet].withdrawSumAmount??0,
                         investmentAmount:listWallet[ref
                             .watch(changeWalletProviders.notifier)
                             .numWallet].total! ,
                         cash: listWallet[ref
                             .watch(changeWalletProviders.notifier)
                             .numWallet].cash!,
                         idWallet: listWallet[ref
                             .watch(changeWalletProviders.notifier)
                             .numWallet].id!,
                       ));

                      },
                  ),
                ],
              ),
              listWallet.isEmpty
                  ? SizedBox()
                  : Consumer(
                      builder: (context, ref, child) {
                        ref.watch(changeWalletProviders);
                        return ListOfSharesWidget(
                          cash: listWallet[ref
                              .watch(changeWalletProviders.notifier)
                              .numWallet].cash!,
                          ratioSpare: int.parse(listWallet[ref
                              .watch(changeWalletProviders.notifier)
                              .numWallet].ratioSpare!),
                          shares: listWallet[ref
                                      .watch(changeWalletProviders.notifier)
                                      .numWallet]
                                  .shares ??
                              [],
                        );
                      },
                    ),
            ],
          ),
        ),
      ],
    );
  }
}
