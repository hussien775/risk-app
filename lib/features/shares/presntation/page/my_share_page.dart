import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:risk/core/widget/fade_in_down_widget.dart';
import 'package:risk/core/widget/sliver_app_bar_widget.dart';
import 'package:risk/features/shares/presntation/widget/container_of_my_share_app_bar_widget.dart';
import 'package:risk/features/shares/presntation/widget/my_share_widget.dart';
import 'package:risk/features/wallet/presentation/state_mangment/mange_wallet_riverpod.dart';

import '../../../../core/widget/auto_size_text_widget.dart';
import '../../../../core/widget/default_button.dart';
import '../../../../core/widget/iswallet_empty_widget.dart';
import '../../../../core/widget/navigateTo.dart';
import '../../../../core/widget_of_check_state_of_api/check_state_in_get_api_data_widget.dart';
import '../../../../generated/l10n.dart';
import '../../../wallet/presentation/page/add_wallet_page.dart';

class MySharePage extends StatelessWidget {
  const MySharePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer(
        builder:(context, ref, child) {
          final state = ref.watch(walletProvider);
          return CheckStateInGetApiDataWidget(
          state: state,
          widgetOfData: Column(
            children: [
              SliverAppBarWidget(
                title: S.of(context).myShares,
                widget: ContainerOfMyShareAppBarWidget(),
              ),
              Expanded(
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: FadeInDownWidget(
                      child:state.data==false?
                      IswalletEmptyWidget() :MyShareWidget(
                    shares: state.data??[],
                    numberWallet: ref.watch(changeWalletProviders.notifier).numWallet,
                  )),
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
