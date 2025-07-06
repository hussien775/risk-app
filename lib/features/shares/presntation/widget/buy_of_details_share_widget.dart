import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:risk/core/widget/default_button.dart';
import 'package:risk/core/widget/skeletoizer_widget.dart';
import 'package:risk/core/widget_of_check_state_of_api/check_state_in_get_api_data_widget.dart';
import 'package:risk/features/shares/data/model/pay_sell_data.dart';
import 'package:risk/features/shares/presntation/widget/add_buy_process_widget.dart';
import '../../../../core/widget/message_flushbar_widget.dart';
import '../../../../core/widget/show_modal_bottom_sheet_widget.dart';
import '../../../../generated/l10n.dart';
import '../state_mangment/buy_riverpod.dart';
import 'list_of_buy_widget.dart';

class BuyOfDetailsShareWidget extends ConsumerWidget {
  const BuyOfDetailsShareWidget({super.key,required this.shareId,required this.cash,required this.ratioSpare});
  final int shareId;
  final int cash;
  final int ratioSpare;


  @override
  Widget build(BuildContext context, ref) {
    final state = ref.watch(buyProvider);
    return CheckStateInGetApiDataWidget(
      state: state,
      widgetOfLoading: SkeletonizerWidget(
          child: ListOfBuyWidget(
        buyData: PaySellData.fakeBuyData,
      )),
      widgetOfData: Padding(
        padding: EdgeInsets.all(15.0.sp),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              DefaultButtonWidget(text: S.of(context).addBuy,
                onPressed: (){
                if(cash==0){
                  flushBarErrorWidget(
                    context: context,
                    title: "عذرا رصيدك الحالي صفر",
                    text: "قم بايداع مبلغ الى المحفظة لاستكمال عملية الشراء",
                  );
                }else{
                  showModalBottomSheetWidget(
                      context: context,
                      page:AddBuyProcessWidget(idShare: shareId,ratioSpare: ratioSpare,cash: cash,)
                  );
                }

                },
              ),
              ListOfBuyWidget(
                buyData: state.data ?? [],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
