import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:risk/core/widget/default_button.dart';
import 'package:risk/core/widget/skeletoizer_widget.dart';
import 'package:risk/core/widget_of_check_state_of_api/check_state_in_get_api_data_widget.dart';
import 'package:risk/features/shares/data/model/pay_sell_data.dart';
import 'package:risk/features/shares/presntation/state_mangment/sale_riverpod.dart';
import 'package:risk/features/shares/presntation/widget/list_of_sale_widget.dart';
import '../../../../core/widget/show_modal_bottom_sheet_widget.dart';
import '../../../../generated/l10n.dart';
import 'add_sale_process_widget.dart';

class SellOfDetailsShareWidget extends ConsumerWidget {
  const SellOfDetailsShareWidget({super.key,required this.shareId});
  final int shareId;
  @override
  Widget build(BuildContext context,ref) {
    final state = ref.read(saleProvider);
    return CheckStateInGetApiDataWidget(
      state: state,
      widgetOfLoading: SkeletonizerWidget(child: ListOfSaleWidget(
          saleData: PaySellData.fakeSellData
      ), ),
      widgetOfData: Padding(
        padding:  EdgeInsets.all(15.0.sp),
        child: SingleChildScrollView(
          physics:const BouncingScrollPhysics(),
          child:  Column(
              children: [
                DefaultButtonWidget(text: S.of(context).addSale,
                  onPressed: (){
                    showModalBottomSheetWidget(
                        context: context,
                        page:AddSaleProcessWidget(idShare: shareId)
                    );
                  },
                ),
                ListOfSaleWidget(
                  saleData: state.data ?? [],
                ),

              ],
            ),
          ),
        ),
      );
  }
}
