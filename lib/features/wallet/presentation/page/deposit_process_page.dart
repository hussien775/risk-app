import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:risk/core/widget/sliver_app_bar_widget.dart';
import 'package:risk/features/wallet/data/model/deposit_model.dart';
import 'package:risk/features/wallet/presentation/widget/container_of_withdraw_and_deposit_in_appbar_widget.dart';
import 'package:risk/features/wallet/presentation/widget/list_of_deposit_process_widget.dart';
import 'package:risk/features/wallet/presentation/widget/shimmer_of_deposit_withdraw_widget.dart';
import '../../../../core/widget_of_check_state_of_api/check_state_in_get_api_data_widget.dart';
import '../state_mangment/deposit_riverpod.dart';

class DepositProcessPage extends ConsumerWidget {
  final int idWallet;
  const DepositProcessPage({
    required this.idWallet,
    super.key,
  });



  @override
  Widget build(BuildContext context, ref) {
    final state = ref.watch(depositProvider);

    return Scaffold(
      body: CheckStateInGetApiDataWidget(
        state: state,
        widgetOfLoading:ShimmerOfDepositAndWithdrawWidget(),
        widgetOfData: Column(
          children: [

            SliverAppBarWidget(
              title: "عمليات الاستثمار",
              widget: ContainerOfDepositAndWithdrawWidget(
                isDeposit: true,
                cashInDeposit: state.data??[],
                idWallet: idWallet,
              ),
              isSecondryPage: true,
            ),
            Flexible(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Padding(
                  padding: EdgeInsets.only(left: 10.0.sp, right: 10.sp),
                  child: ListOfDepositProcessWidget(
                      depositProcess: state.data ?? []),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
