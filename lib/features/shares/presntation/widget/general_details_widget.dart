import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:risk/features/shares/data/model/shares_data.dart';
import 'package:risk/features/shares/presntation/state_mangment/share_riverpod.dart';
import 'package:risk/features/shares/presntation/widget/container_financial_account_widget.dart';
import 'package:risk/features/shares/presntation/widget/container_of_details_share_widget.dart';
import 'package:risk/features/shares/presntation/widget/design_buy_and_sell_indicators_widget.dart';
import 'package:risk/features/shares/presntation/widget/skeletonizer_of_details_share_widget.dart';
import '../../../../core/widget_of_check_state_of_api/check_state_in_get_api_data_widget.dart';

class GeneralDetailsWidget extends ConsumerWidget {
  const GeneralDetailsWidget({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final state = ref.watch(shareProvider);
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: CheckStateInGetApiDataWidget(
        state: state,
        widgetOfLoading: SkeletonizerOfDetailsShareWidget(),
        widgetOfData: Padding(
          padding: EdgeInsets.all(15.0.sp),
          child: Column(
            children: [
              ContainerDetailsShareWidget(
                sharesData: state.data ?? SharesData(),
              ),
              22.verticalSpace,
              ContainerOfFinancialAccountWidget(
                sharesData: state.data ?? SharesData(),
              ),
              22.verticalSpace,
              DesignBuyAndSellIndicatorsWidget(
                sharesData: state.data ?? SharesData(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
