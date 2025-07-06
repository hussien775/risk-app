import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:risk/features/home/widget/home_widget.dart';
import '../../../core/state/state_data.dart';
import '../../../core/widget/auto_size_text_widget.dart';
import '../../../core/widget/default_button.dart';
import '../../../core/widget/iswallet_empty_widget.dart';
import '../../../core/widget/navigateTo.dart';
import '../../../core/widget/skeletoizer_widget.dart';
import '../../../core/widget/sliver_app_bar_widget.dart';
import '../../../core/widget_of_check_state_of_api/check_state_in_get_api_data_widget.dart';
import '../../../generated/l10n.dart';
import '../../wallet/data/model/wallet_model.dart';
import '../../wallet/presentation/page/add_wallet_page.dart';
import '../../wallet/presentation/state_mangment/mange_wallet_riverpod.dart';
import '../../wallet/presentation/widget/shimmer_of_deposit_withdraw_widget.dart';
import '../widget/design_carousel_slider_widget.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, ref) {
    DataState state = ref.watch(walletProvider);
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () {
          return ref.refresh(walletProvider.notifier).getWalletData();
        },
        child: Column(
          children: [
            SliverAppBarWidget(
              title: "",
              isHomePage: true,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: CheckStateInGetApiDataWidget(
                  state: state,
                  widgetOfLoading: SkeletonizerWidget(
                    child: HomeWidget(
                      listWallet: WalletData.fakeWalletData,
                    ),
                  ),
                  widgetOfData: state.data == false
                      ? IswalletEmptyWidget()
                      : Column(children: [
                          DesignCarouselSliderWidget(),
                          HomeWidget(
                            listWallet: state.data ?? [],
                          ),
                        ]),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
