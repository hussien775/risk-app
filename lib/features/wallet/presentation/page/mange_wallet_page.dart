import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:risk/core/state/state_data.dart';
import 'package:risk/core/widget/fade_in_down_widget.dart';
import 'package:risk/core/widget/sliver_app_bar_widget.dart';
import 'package:risk/features/wallet/presentation/state_mangment/mange_wallet_riverpod.dart';
import 'package:risk/features/wallet/presentation/widget/mange_wallet_widget.dart';
import '../../../../core/widget/auto_size_text_widget.dart';
import '../../../../core/widget/default_button.dart';
import '../../../../core/widget/iswallet_empty_widget.dart';
import '../../../../core/widget/navigateTo.dart';
import '../../../../core/widget_of_check_state_of_api/check_state_in_get_api_data_widget.dart';
import '../../../../generated/l10n.dart';
import '../widget/container_of_cash_in_mange_wallet_widget.dart';
import 'add_wallet_page.dart';

class MangeWalletPage extends StatelessWidget {
  const MangeWalletPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer(
        builder: (context, ref, child) {
          DataState state = ref.watch(walletProvider);
          int numWallet = ref.watch(changeWalletProviders.notifier).numWallet;
          return CheckStateInGetApiDataWidget(
            state: state,
            widgetOfData:state.data==false? Center(
              child: IswalletEmptyWidget()
            ) :Column(
              children: [
                SliverAppBarWidget(
                  title: S.of(context).mangeWallet,
                  widget: ContainerOfCashInMangeWalletAppBarWidget(
                    cash: state.data ?? 0,
                    numWallet: numWallet,
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: FadeInDownWidget(
                      // child: ShowCaseWidget(
                      //   builder: (context) => MangeWalletWidget(
                      //     walletData: state.data,
                      //     numWallet: numWallet,
                      //   ),
                      //   autoPlay: true,
                      //   autoPlayDelay: const Duration(seconds: 5),
                      // ),
                      child: MangeWalletWidget(
                        walletData: state.data??[],
                        numWallet: numWallet,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
