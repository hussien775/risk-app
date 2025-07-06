import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:risk/core/widget/default_button.dart';
import 'package:risk/core/widget/text_form_field.dart';
import 'package:risk/features/shares/data/model/pay_sell_data.dart';
import 'package:risk/features/shares/presntation/state_mangment/buy_riverpod.dart';
import 'package:risk/features/wallet/presentation/state_mangment/mange_wallet_riverpod.dart';
import '../../../../core/widget/date_helper.dart';
import '../../../../core/widget/message_flushbar_widget.dart';
import '../../../../core/widget_of_check_state_of_api/check_state_in_post_api_data_widget.dart';
import '../state_mangment/sale_riverpod.dart';
import '../state_mangment/share_riverpod.dart';

// ignore: must_be_immutable
class AddBuyProcessWidget extends ConsumerStatefulWidget {
 const AddBuyProcessWidget({super.key, required this.idShare,required this.ratioSpare,required this.cash});

 final int ratioSpare;
 final int cash;
  final int idShare;

  @override
  ConsumerState<AddBuyProcessWidget> createState() => _AddBuyProcessWidgetState();
}

class _AddBuyProcessWidgetState extends ConsumerState<AddBuyProcessWidget> {
  TextEditingController count = TextEditingController();
  final TextEditingController dateBuy = TextEditingController();
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

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(addBuyProvider);
    int spare=0;
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: EdgeInsets.all(12.0.sp),
        child: Column(
          children: [
            AutoSizeText(
              'شراء اسهم',
              maxFontSize: 20,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17.sp),
            ),
            Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
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
                    //label: "الكمية",
                    fillColor: Colors.grey[200],
                    isRequired: true,
                    erorrFormFieldValidator: "قم بكتابة كمية الاسهم اولا",
                    onChanged: (value){
                      setState(() {
                        if(unitAmount.text!=""){
                          int spare= widget.cash- (int.parse(count.text)*int.parse(unitAmount.text));
                          print(spare);

                          if(spare<widget.ratioSpare){
                            flushBarWarringWidget(
                                context: context,
                                text: "لقد تجاوزت المبلغ الاحتياطي الخاص بالمحفظة"
                            );
                          }
                        }

                      });

                    },
                  ),
                  4.verticalSpace,

                  AutoSizeText(
                    'سعر الشراء السهم الواحد',
                    maxFontSize: 20,
                    style:
                    TextStyle(fontWeight: FontWeight.bold, fontSize: 13.sp),
                  ),
                  4.verticalSpace,
                  TextFormFieldWidget(
                    controller: unitAmount,
                    type: TextInputType.number,
                    //label: "سعر الشراء السهم الواحد",
                    fillColor: Colors.grey[200],
                    isRequired: true,
                    erorrFormFieldValidator:
                        "قم بكتابة سعر الشراء السهم الواحد اولا",
                    onChanged: (value){
                      setState(() {
                        if(count.text!=""){
                          int spare= widget.cash- (int.parse(count.text)*int.parse(unitAmount.text));
                          print(spare);

                          if(spare<widget.ratioSpare){
                            flushBarWarringWidget(
                                context: context,
                                text: "لقد تجاوزت المبلغ الاحتياطي الخاص بالمحفظة"
                            );
                          }
                        }

                      });

                    },
                  ),
                  15.verticalSpace,
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
                  15.verticalSpace,
                  CheckStateInPostApiDataWidget(
                    state: state,
                    messageSuccess: "تمت عملية الشراء بنجاح",
                    functionSuccess: () {
                      ref
                          .read(buyProvider.notifier)
                          .getPayData(shareId: widget.idShare);

                      ref
                          .read(shareProvider.notifier)
                          .getSharesData(shareId: widget.idShare);
                      ref.read(saleProvider.notifier).getSaleData(shareId: widget.idShare);

                      ref.read(walletProvider.notifier).getWalletData();
                      Navigator.pop(context);
                    },
                    bottonWidget: DefaultButtonWidget(
                      text: "شراء",
                      textSize: 15,
                      onPressed: () {
                        final isValid = _formKey.currentState!.validate();
                        if (isValid) {
                          spare= widget.cash- (int.parse(count.text)*int.parse(unitAmount.text));
                          setState(() {
                            if(spare<0){
                              print(spare);
                              flushBarErrorWidget(
                                context: context,
                                title:" لا يمكنك اكمال العملية",
                                text: "اجمالي مبلغ شراء الاسهم اكبر من المبلغ المتوفر في المحفظة",
                              );

                            }
                            else{
                              final buyData = PaySellData(
                                  unitAmount: int.parse(unitAmount.text),
                                  idShare: widget.idShare,
                                  count: int.parse(count.text),
                                  dateBuy: dateBuy.text);
                              ref
                                  .read(addBuyProvider.notifier)
                                  .addBuyProcess(buyData: buyData);
                            }
                          });

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
