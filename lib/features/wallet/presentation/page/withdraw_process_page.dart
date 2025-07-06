import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:risk/core/widget/sliver_app_bar_widget.dart';
import 'package:risk/core/widget_of_check_state_of_api/check_state_in_get_api_data_widget.dart';
import 'package:risk/features/wallet/presentation/widget/container_of_withdraw_and_deposit_in_appbar_widget.dart';
import '../state_mangment/withdraw_riverpod.dart';
import '../widget/shimmer_of_deposit_withdraw_widget.dart';
import '../widget/withdraw_process_widget.dart';

class WithdrawProcessPage extends ConsumerWidget {
  const WithdrawProcessPage(
      {super.key,  required this.idWallet});

  final int idWallet;

  @override
  Widget build(BuildContext context, ref) {
    final state = ref.watch(withdrawProvider);
    return Scaffold(
      body: CheckStateInGetApiDataWidget(
        state: state,
        widgetOfLoading: ShimmerOfDepositAndWithdrawWidget(),
        widgetOfData: Column(
          children: [
            SliverAppBarWidget(
              title: "عملية السحب",
              widget: ContainerOfDepositAndWithdrawWidget(
                isDeposit: false,
                cashInWithDraw: state.data??[],
                idWallet: idWallet,
              ),
              isSecondryPage: true,
            ),
            Flexible(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Padding(
                  padding: EdgeInsets.only(left: 10.0.sp, right: 10.sp),
                  child: ListWithdrawProcessWidget(
                    withdrawProcess: state.data ?? [],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );

  }
}
