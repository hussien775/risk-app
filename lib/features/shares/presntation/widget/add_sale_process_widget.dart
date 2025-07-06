import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:risk/core/state/state.dart';
import 'package:risk/core/widget/default_button.dart';
import 'package:risk/core/widget/text_form_field.dart';
import 'package:risk/features/shares/data/model/pay_sell_data.dart';
import 'package:risk/features/shares/presntation/state_mangment/buy_riverpod.dart';
import 'package:risk/features/shares/presntation/state_mangment/sale_riverpod.dart';
import '../../../../core/widget/date_helper.dart';
import '../../../../core/widget_of_check_state_of_api/check_state_in_post_api_data_widget.dart';
import '../../../wallet/presentation/state_mangment/mange_wallet_riverpod.dart';
import '../state_mangment/share_riverpod.dart';

// ignore: must_be_immutable
class AddSaleProcessWidget extends ConsumerStatefulWidget {
 const AddSaleProcessWidget({super.key, required this.idShare});

  final int idShare;

  @override
  ConsumerState<AddSaleProcessWidget> createState() => _AddSaleProcessWidgetState();
}

class _AddSaleProcessWidgetState extends ConsumerState<AddSaleProcessWidget> {
  TextEditingController count = TextEditingController();
  final TextEditingController dateBuy = TextEditingController();
  final TextEditingController dateSale = TextEditingController();
  TextEditingController unitAmount = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  Future<void> _showDateBuyPicker() async {
    DateTime? selectedDate = await DateHelper.selectDate(context);
    if (selectedDate != null) {
      setState(() {
        dateBuy.text = "${selectedDate.toLocal()}".split(' ')[0];
      });
    }
  }
  Future<void> _showDateSalePicker() async {
    DateTime? selectedDate = await DateHelper.selectDate(context);
    if (selectedDate != null) {
      setState(() {
        dateSale.text = "${selectedDate.toLocal()}".split(' ')[0];
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    final state = ref.watch(addSaleProvider);

    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding:  EdgeInsets.all(12.0.sp),
        child: Column(
          children: [
            AutoSizeText(
              'بيع اسهم',
              maxFontSize: 20,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17.sp),
            ),
            Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  15.verticalSpace,
                  AutoSizeText(
                    'الكمية',
                    maxFontSize: 20,
                    style:
                    TextStyle(fontWeight: FontWeight.bold, fontSize: 13.sp),
                  ),
                  4.verticalSpace,
                  TextFormFieldWidget(
                    controller: count,
                    type: TextInputType.number,
                    fillColor: Colors.grey[200],
                    isRequired: true,
                    erorrFormFieldValidator: "قم بكتابة كمية الاسهم اولا",
                  ),
                  4.verticalSpace,

                  AutoSizeText(
                    "سعر البيع السهم الواحد",
                    maxFontSize: 20,
                    style:
                    TextStyle(fontWeight: FontWeight.bold, fontSize: 13.sp),
                  ),
                  4.verticalSpace,
                  TextFormFieldWidget(
                    controller: unitAmount,
                    type: TextInputType.number,
                    fillColor: Colors.grey[200],
                    isRequired: true,
                    erorrFormFieldValidator:
                    "قم بكتابة سعر البيع السهم الواحد اولا",
                  ),
                  4.verticalSpace,

                  AutoSizeText(
                    'تاريخ الشراء',
                    maxFontSize: 20,
                    style:
                    TextStyle(fontWeight: FontWeight.bold, fontSize: 13.sp),
                  ),
                  4.verticalSpace,
                  InkWell(
                    onTap:() =>_showDateBuyPicker(),
                    child: IgnorePointer(
                      child: TextFormFieldWidget(
                        controller: dateBuy,
                        type: TextInputType.number,
                        fillColor: Colors.grey[200],
                        isRequired: true,
                        suffixIcon: Icon(Icons.date_range),
                        erorrFormFieldValidator:
                        "قم بكتابة تاريخ شراء السهم",
                      ),
                    ),
                  ),
                  4.verticalSpace,

                  AutoSizeText(
                    'تاريخ البيع',
                    maxFontSize: 20,
                    style:
                    TextStyle(fontWeight: FontWeight.bold, fontSize: 13.sp),
                  ),
                  4.verticalSpace,
                  InkWell(
                    onTap:() =>_showDateSalePicker(),
                    child: IgnorePointer(
                      child: TextFormFieldWidget(
                        controller: dateSale,
                        type: TextInputType.number,
                        fillColor: Colors.grey[200],
                        isRequired: true,
                        suffixIcon: Icon(Icons.date_range),
                        erorrFormFieldValidator:
                        "قم بكتابة تاريخ بيع السهم",
                      ),
                    ),
                  ),
                  15.verticalSpace,
                  CheckStateInPostApiDataWidget(
                    state: state,
                    messageSuccess: "تمت عملية البيع بنجاح",
                    functionSuccess: () {
                      ref.read(shareProvider.notifier).getSharesData(shareId: widget.idShare);
                      ref.read(buyProvider.notifier).getPayData(shareId: widget.idShare);
                      ref.read(saleProvider.notifier).getSaleData(shareId: widget.idShare);
                      ref.read(walletProvider.notifier).getWalletData();


                      Navigator.pop(context);
                    },

                    bottonWidget: DefaultButtonWidget(
                      text: "بيع",
                      textSize: 15,

                      onPressed: () {

                        final isValid = _formKey.currentState!.validate();
                        if (isValid) {
                          final saleData = PaySellData(
                            unitAmount: int.parse(unitAmount.text),
                            idShare: widget.idShare,
                            count: int.parse(count.text),
                            dateBuy: dateBuy.text,
                            dateSale: dateSale.text
                          );
                          ref
                              .read(addSaleProvider.notifier)
                              .addSaleProcess(saleData: saleData);
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
