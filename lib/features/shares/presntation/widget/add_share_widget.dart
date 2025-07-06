// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:risk/core/widget/auto_size_text_widget.dart';
// import 'package:risk/core/widget/default_button.dart';
// import 'package:risk/core/widget/text_form_field.dart';
// import 'package:risk/features/shares/data/model/shares_data.dart';
// import 'package:risk/features/shares/presntation/state_mangment/share_riverpod.dart';
// import 'package:risk/features/wallet/presentation/state_mangment/mange_wallet_riverpod.dart';
// import '../../../../core/strings/equation.dart';
// import '../../../../core/widget/desgin_of_icon_display_app_widget.dart';
// import '../../../../core/widget_of_check_state_of_api/check_state_in_post_api_data_widget.dart';
//
// class AddShareWidget extends ConsumerStatefulWidget {
//   const AddShareWidget(
//       {super.key,
//       required this.cash,
//       required this.investmentAmount,
//       required this.idWallet,
//       required this.withdrawalAmount});
//
//   final int idWallet;
//   final int cash;
//   final int investmentAmount;
//   final int withdrawalAmount;
//
//   @override
//   ConsumerState<AddShareWidget> createState() => _AddShareWidgetState();
// }
//
// class _AddShareWidgetState extends ConsumerState<AddShareWidget> {
//   final keyOne = GlobalKey();
//   final keyTwo = GlobalKey();
//   final keyThree = GlobalKey();
//   final keyFour = GlobalKey();
//   final keyFive = GlobalKey();
//   final keySix = GlobalKey();
//   final keySeven = GlobalKey();
//   final _formKey = GlobalKey<FormState>();
//
//   TextEditingController name = TextEditingController();
//   TextEditingController priceBuyShare = TextEditingController();
//   TextEditingController valueStopLoss = TextEditingController();
//   TextEditingController valueStopWin = TextEditingController();
//   TextEditingController totalExpectedProfit = TextEditingController();
//   TextEditingController totalExpectedLoss = TextEditingController();
//   TextEditingController numSharesCanBuy = TextEditingController();
//   TextEditingController paidPrice = TextEditingController();
//   TextEditingController paidPriceAndRatioOfPaid = TextEditingController();
//   TextEditingController returnOfRisk = TextEditingController();
//   TextEditingController x = TextEditingController();
//
//   String profitFromOneShare = '0';
//   String lossFromOneShare = '0';
//
//   //TextEditingController x = TextEditingController();
//
//   @override
//   Widget build(BuildContext context) {
//     final state = ref.watch(addShareProvider);
//     return Form(
//       key: _formKey,
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.start,
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           AutoSizeTextWidget(text: "الاسم", notBoldFont: true),
//           8.verticalSpace,
//           TextFormFieldWidget(
//             controller: name,
//             type: TextInputType.emailAddress,
//             fillColor: Colors.white,
//             isRequired: true,
//             erorrFormFieldValidator: "قم بكتابة اسم السهم ",
//           ),
//           8.verticalSpace,
//           AutoSizeTextWidget(text: "قيمة شراء السهم", notBoldFont: true),
//           8.verticalSpace,
//           // Showcase(
//           //   key: keyTwo,
//           //   description: "قيمة شراء السهم",
//           //   tooltipBackgroundColor: const Color(0xffFFF8Ee),
//           //   child:
//           TextFormFieldWidget(
//             controller: priceBuyShare,
//             type: TextInputType.number,
//             fillColor: Colors.white,
//             suffixIcon: DesginOfIconDisplayAppWidget(
//               keyOfWidget: keyTwo,
//             ),
//             isRequired: true,
//             erorrFormFieldValidator: "قم بكتابة قيمة شراء السهم ",
//             onChanged: (value) {
//               print(widget.cash.toString());
//               setState(() {
//                 numSharesCanBuy.text = numCanBuyEquation(
//                     ratioDanger: 267.24,
//                     priceShare: priceBuyShare.text,
//                     stopLoss: valueStopLoss.text);
//               });
//               paidPrice.text = pricePaid(
//                   numShares: numSharesCanBuy.text,
//                   priceShare: priceBuyShare.text);
//               paidPriceAndRatioOfPaid.text =
//                   ("${paidPrice.text}/${ratioPricePaid(cash: widget.cash.toString(), paidPrice: paidPrice.text, pick: widget.withdrawalAmount.toString())}");
//               totalExpectedLoss.text = totalLossExpected(
//                   numShares: numSharesCanBuy.text,
//                   priceShare: priceBuyShare.text,
//                   valueStopLoss: valueStopLoss.text);
//             },
//           ),
//           // ),
//           // 8.verticalSpace,
//           8.verticalSpace,
//           Row(
//             mainAxisAlignment: MainAxisAlignment.start,
//             children: [
//               Expanded(
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     AutoSizeTextWidget(
//                         text: "قيمة وقف الخسارة", notBoldFont: true),
//                     8.verticalSpace,
//                     // Showcase(
//                     //   key: keyFour,
//                     //   description: "قيمة وقف الخسارة",
//                     //   tooltipBackgroundColor: const Color(0xffFFF8Ee),
//                     //   child:
//                     TextFormFieldWidget(
//                       controller: valueStopLoss,
//                       type: TextInputType.number,
//                       fillColor: Colors.white,
//                       suffixIcon: DesginOfIconDisplayAppWidget(
//                         keyOfWidget: keyFour,
//                       ),
//                       isRequired: true,
//                       erorrFormFieldValidator: "قم بكتابة قيمة وقف الخسارة ",
//                       onChanged: (value) {
//                         setState(() {
//                           numSharesCanBuy.text = numCanBuyEquation(
//                               ratioDanger: 267.24,
//                               priceShare: priceBuyShare.text,
//                               stopLoss: valueStopLoss.text);
//                         });
//                         paidPrice.text = pricePaid(
//                             numShares: numSharesCanBuy.text,
//                             priceShare: priceBuyShare.text);
//                         paidPriceAndRatioOfPaid.text =
//                             ("${paidPrice.text} / ${ratioPricePaid(cash: widget.cash.toString(), paidPrice: paidPrice.text, pick: "1230")}");
//                         totalExpectedLoss.text = totalLossExpected(
//                             numShares: numSharesCanBuy.text,
//                             priceShare: priceBuyShare.text,
//                             valueStopLoss: valueStopLoss.text);
//                         lossFromOneShare = lossOneShare(
//                             priceShare: priceBuyShare.text,
//                             valueStopLoss: valueStopLoss.text);
//                       },
//
//                       //   ),
//                     ),
//                   ],
//                 ),
//               ),
//               7.horizontalSpace,
//               Expanded(
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     AutoSizeTextWidget(
//                         text: "اجمالي الخسارة المتوقعة", notBoldFont: true),
//                     8.verticalSpace,
//                     TextFormFieldWidget(
//                       controller: totalExpectedLoss,
//                       type: TextInputType.emailAddress,
//                       fillColor: Colors.white,
//                       enabled: false,
//                       onChanged: (value) {
//                         setState(() {
//                           totalExpectedLoss.text = totalLossExpected(
//                               numShares: numSharesCanBuy.text,
//                               priceShare: priceBuyShare.text,
//                               valueStopLoss: valueStopLoss.text);
//                         });
//                       },
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//           8.verticalSpace,
//           Row(
//             mainAxisAlignment: MainAxisAlignment.start,
//             children: [
//               Expanded(
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     AutoSizeTextWidget(
//                         text: "قيمة وقف الربح", notBoldFont: true),
//                     8.verticalSpace,
//                     // Showcase(
//                     //   key: keyFive,
//                     //   description: "قمة الربح",
//                     //   tooltipBackgroundColor: const Color(0xffFFF8Ee),
//                     //   child:
//                     TextFormFieldWidget(
//                       controller: valueStopWin,
//                       type: TextInputType.number,
//                       fillColor: Colors.white,
//                       suffixIcon: DesginOfIconDisplayAppWidget(
//                         keyOfWidget: keyFive,
//                       ),
//                       isRequired: true,
//                       erorrFormFieldValidator: "قم بكتابة قيمة وقف الربح ",
//                       onChanged: (value) {
//                         setState(() {
//                           totalExpectedProfit.text = totalProfitExpected(
//                               numShares: numSharesCanBuy.text,
//                               priceShare: priceBuyShare.text,
//                               valueStopProfit: valueStopWin.text);
//                         });
//                         profitFromOneShare = profitOneShare(
//                             priceShare: priceBuyShare.text,
//                             valueStopProfit: valueStopWin.text);
//                         returnOfRisk.text = returnFromRisk(
//                             lossFromOneShare: lossFromOneShare,
//                             profitFromOneShare: profitFromOneShare);
//                       },
//
//                       //   ),
//                     ),
//                   ],
//                 ),
//               ),
//               7.horizontalSpace,
//               Expanded(
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     AutoSizeTextWidget(
//                         text: "اجمالي الربح المتوقع", notBoldFont: true),
//                     8.verticalSpace,
//                     TextFormFieldWidget(
//                       controller: totalExpectedProfit,
//                       type: TextInputType.emailAddress,
//                       fillColor: Colors.white,
//                       enabled: false,
//                       onChanged: (value) {
//                         setState(() {
//                           totalExpectedProfit.text = totalProfitExpected(
//                               numShares: numSharesCanBuy.text,
//                               priceShare: priceBuyShare.text,
//                               valueStopProfit: valueStopWin.text);
//                         });
//                       },
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//           8.verticalSpace,
//           AutoSizeTextWidget(
//               text: "عدد الاسهم المسموح بالشراء", notBoldFont: true),
//           8.verticalSpace,
//           // Showcase(
//           //   key: keyOne,
//           //   description: "عدد الاسهم المسموح بالشراء من نسبة المخاطر",
//           //   tooltipBackgroundColor: const Color(0xffFFF8Ee),
//           //   child:
//           TextFormFieldWidget(
//             controller: numSharesCanBuy,
//             type: TextInputType.emailAddress,
//             fillColor: Colors.white,
//             suffixIcon: DesginOfIconDisplayAppWidget(
//               keyOfWidget: keyOne,
//             ),
//             enabled: false,
//           ),
//           // ),
//           8.verticalSpace,
//
//           AutoSizeTextWidget(
//               text: "المبلغ المدفوع / نسبة التغطية", notBoldFont: true),
//           8.verticalSpace,
//           // Showcase(
//           //   key: keyThree,
//           //   description:"المبلغ المدفوع / نسبة التغطية",
//           //   tooltipBackgroundColor: const Color(0xffFFF8Ee),
//           //   child:
//           TextFormFieldWidget(
//               controller: paidPriceAndRatioOfPaid,
//               type: TextInputType.emailAddress,
//               fillColor: Colors.white,
//               enabled: false,
//               // onChanged: (value){
//               //   paidPrice.text =pricePaid(numShares:numSharesCanBuy.text,priceShare: priceBuyShare.text);
//               // },
//               suffixIcon: DesginOfIconDisplayAppWidget(
//                 keyOfWidget: keyThree,
//               )),
//           //),
//           8.verticalSpace,
//
//           AutoSizeTextWidget(
//               text: " نسبة المخاطر من المحفظة كامل", notBoldFont: true),
//           8.verticalSpace,
//           // Showcase(
//           //   key: keySix,
//           //   description: " نسبة المخاطر من المحفظة كامل",
//           //   tooltipBackgroundColor: const Color(0xffFFF8Ee),
//           //   child:
//           TextFormFieldWidget(
//             controller: x,
//             type: TextInputType.emailAddress,
//             fillColor: Colors.white,
//             suffixIcon: DesginOfIconDisplayAppWidget(
//               keyOfWidget: keySix,
//             ),
//             enabled: false,
//             label: "-",
//
//             // ),
//           ),
//           8.verticalSpace,
//           AutoSizeTextWidget(text: "العائد من المخاطر", notBoldFont: true),
//           8.verticalSpace,
//           // Showcase(
//           //   key: keySeven,
//           //   description: "العائد من المخاطر",
//           //   tooltipBackgroundColor: const Color(0xffFFF8Ee),
//           //   child:
//           TextFormFieldWidget(
//               controller: returnOfRisk,
//               type: TextInputType.emailAddress,
//               fillColor: Colors.white,
//               enabled: false,
//               suffixIcon: DesginOfIconDisplayAppWidget(
//                 keyOfWidget: keySeven,
//               )),
//
//           // ),
//           14.verticalSpace,
//
//           CheckStateInPostApiDataWidget(
//             state: state,
//             messageSuccess: "تمت عملية الاضافة بنجاح",
//             functionSuccess: () {
//               ref.read(walletProvider.notifier).getWalletData();
//               Navigator.pop(context);
//             },
//             bottonWidget: DefaultButtonWidget(
//               text: "اضافة",
//               textSize: 15,
//               onPressed: () {
//                 final isValid = _formKey.currentState!.validate();
//                 if (isValid) {
//                   final share = SharesData(
//                     walletId: widget.idWallet,
//                     name: name.text,
//                     stopLossValue: double.parse(valueStopLoss.text),
//                     priceOfShare: double.parse(priceBuyShare.text),
//                     numberOfShareToBuy: double.parse(numSharesCanBuy.text),
//                     stopValueProfit: double.parse(valueStopWin.text),
//                     totalExpectedLoss: double.parse(totalExpectedLoss.text),
//                     totalExpectedProfit: double.parse(totalExpectedProfit.text),
//                     returnFromRisk: double.parse(returnOfRisk.text),
//                     theAmountPaidFromTheCoverageRatio:
//                         double.parse(paidPrice.text),
//                     riskRatio: double.parse(returnOfRisk.text),
//                   );
//                   ref
//                       .read(addShareProvider.notifier)
//                       .addShareProcess(share: share);
//                 }
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
// lib/features/shares/presentation/widgets/add_share_widget.dart

// importاتك كما هي
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:risk/core/widget/auto_size_text_widget.dart';
import 'package:risk/core/widget/default_button.dart';
import 'package:risk/core/widget/text_form_field.dart';
import 'package:risk/features/shares/data/model/shares_data.dart';
import 'package:risk/features/shares/presntation/state_mangment/share_riverpod.dart';
import 'package:risk/features/wallet/presentation/state_mangment/mange_wallet_riverpod.dart';
import '../../../../core/app_theme_widget.dart';
import '../../../../core/strings/equation.dart';
import '../../../../core/widget/desgin_of_icon_display_app_widget.dart';
import '../../../../core/widget_of_check_state_of_api/check_state_in_post_api_data_widget.dart';

class AddShareWidget extends ConsumerStatefulWidget {
  const AddShareWidget({
    super.key,
    required this.cash,
    required this.investmentAmount,
    required this.idWallet,
    required this.withdrawalAmount,
  });

  final int idWallet;
  final int cash;
  final int investmentAmount;
  final int withdrawalAmount;

  @override
  ConsumerState<AddShareWidget> createState() => _AddShareWidgetState();
}

class _AddShareWidgetState extends ConsumerState<AddShareWidget> {
  final _formKey = GlobalKey<FormState>();
  final keyOne = GlobalKey();
  final keyTwo = GlobalKey();
  final keyThree = GlobalKey();
  final keyFour = GlobalKey();
  final keyFive = GlobalKey();
  final keySix = GlobalKey();
  final keySeven = GlobalKey();

  TextEditingController name = TextEditingController();
  TextEditingController priceBuyShare = TextEditingController();
  TextEditingController valueStopLoss = TextEditingController();
  TextEditingController valueStopWin = TextEditingController();
  TextEditingController totalExpectedProfit = TextEditingController();
  TextEditingController totalExpectedLoss = TextEditingController();
  TextEditingController numSharesCanBuy = TextEditingController();
  TextEditingController paidPrice = TextEditingController();
  TextEditingController paidPriceAndRatioOfPaid = TextEditingController();
  TextEditingController returnOfRisk = TextEditingController();
  TextEditingController ratioDangerFromAllWallet = TextEditingController();

  String profitFromOneShare = '0';
  String lossFromOneShare = '0';

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(addShareProvider);
    final equationNotifier = ref.read(equationProvider.notifier);
    final equation = ref.watch(equationProvider);

    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AutoSizeTextWidget(text: "الاسم", notBoldFont: true),
            8.verticalSpace,
            TextFormFieldWidget(
              controller: name,
              type: TextInputType.text,
              fillColor: Colors.white,
              isRequired: true,
              erorrFormFieldValidator: "قم بكتابة اسم السهم",
            ),
            8.verticalSpace,
            AutoSizeTextWidget(text: "قيمة شراء السهم", notBoldFont: true),
            8.verticalSpace,
            TextFormFieldWidget(
              controller: priceBuyShare,
              type: TextInputType.number,
              fillColor: Colors.white,
              suffixIcon: DesginOfIconDisplayAppWidget(keyOfWidget: keyTwo),
              isRequired: true,
              erorrFormFieldValidator: "قم بكتابة قيمة شراء السهم",
              onChanged: (value) {
                final price = double.tryParse(value) ?? 0;
                equationNotifier.updatePriceShare(price);
                equationNotifier.updateRatioDanger(0.02);
                equationNotifier.updateInvestmentAmount(
                    double.parse(widget.investmentAmount.toString()));

                equationNotifier
                    .updateCash(double.parse(widget.cash.toString()));
                equationNotifier.updatePick(
                    double.parse(widget.withdrawalAmount.toString()));
                equationNotifier.updateNumShares(equationNotifier.numCanBuy);
              },
            ),
            8.verticalSpace,
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AutoSizeTextWidget(
                          text: "قيمة وقف الخسارة", notBoldFont: true),
                      8.verticalSpace,
                      TextFormFieldWidget(
                        controller: valueStopLoss,
                        type: TextInputType.number,
                        fillColor: Colors.white,
                        textColor: redColor,
                        suffixIcon:
                            DesginOfIconDisplayAppWidget(keyOfWidget: keyFour),
                        isRequired: true,
                        erorrFormFieldValidator: "قم بكتابة قيمة وقف الخسارة",
                        onChanged: (value) {
                          final stopLoss = double.tryParse(value) ?? 0;
                          equationNotifier
                              .updateNumShares(equationNotifier.numCanBuy);
                          equationNotifier
                              .updatePaidPrice(equationNotifier.pricePaid);
                          equationNotifier.updateStopLoss(stopLoss);
                        },
                      ),
                    ],
                  ),
                ),
                7.horizontalSpace,
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AutoSizeTextWidget(
                          text: "اجمالي الخسارة المتوقعة", notBoldFont: true),
                      8.verticalSpace,
                      TextFormFieldWidget(
                        controller: totalExpectedLoss
                          ..text = equationNotifier.totalLossExpected
                              .toStringAsFixed(2),
                        type: TextInputType.number,
                        fillColor: Colors.white,
                        textColor: redColor,
                        enabled: false,
                        onChanged: (value) {},
                      ),
                    ],
                  ),
                ),
              ],
            ),
            8.verticalSpace,
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AutoSizeTextWidget(
                          text: "قيمة وقف الربح", notBoldFont: true),
                      8.verticalSpace,
                      TextFormFieldWidget(
                        controller: valueStopWin,
                        type: TextInputType.number,
                        fillColor: Colors.white,
                        suffixIcon:
                            DesginOfIconDisplayAppWidget(keyOfWidget: keyFive),
                        isRequired: true,
                        textColor: greenColor,
                        erorrFormFieldValidator: "قم بكتابة قيمة وقف الربح",
                        onChanged: (value) {
                          final stopProfit = double.tryParse(value) ?? 0;
                          equationNotifier.updateStopProfit(stopProfit);
                        },
                      ),
                    ],
                  ),
                ),
                7.horizontalSpace,
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AutoSizeTextWidget(
                          text: "اجمالي الربح المتوقع", notBoldFont: true),
                      8.verticalSpace,
                      TextFormFieldWidget(
                        controller: totalExpectedProfit
                          ..text = equationNotifier.totalProfitExpected
                              .toStringAsFixed(2),
                        type: TextInputType.number,
                        fillColor: Colors.white,
                        enabled: false,
                        textColor: greenColor,
                        onChanged: (value) {},
                      ),
                    ],
                  ),
                ),
              ],
            ),
            8.verticalSpace,
            AutoSizeTextWidget(
                text: "عدد الاسهم المسموح بالشراء", notBoldFont: true),
            8.verticalSpace,
            TextFormFieldWidget(
              controller: numSharesCanBuy
                ..text = equationNotifier.numCanBuy.toStringAsFixed(2),
              type: TextInputType.number,
              fillColor: Colors.white,
              enabled: false,
              suffixIcon: DesginOfIconDisplayAppWidget(keyOfWidget: keyOne),
              onChanged: (value) {
                // equationNotifier.updateNumShares(value);
                // equationNotifier.updatePaidPrice(value);
              },
            ),
            8.verticalSpace,
            AutoSizeTextWidget(
                text: "المبلغ المدفوع / نسبة التغطية", notBoldFont: true),
            8.verticalSpace,
            TextFormFieldWidget(
              controller: paidPriceAndRatioOfPaid
                ..text =
                    "${equationNotifier.pricePaid.toStringAsFixed(2)} / ${equationNotifier.ratioPricePaid.toStringAsFixed(2)} %",
              type: TextInputType.text,
              fillColor: Colors.white,
              enabled: false,
              suffixIcon: DesginOfIconDisplayAppWidget(keyOfWidget: keyThree),
              onChanged: (value) {
                // print(value);
                // equationNotifier.updatePaidPrice(value);
              },
            ),
            8.verticalSpace,

            AutoSizeTextWidget(
                text: " نسبة المخاطر من المحفظة كامل", notBoldFont: true),
            8.verticalSpace,
            // Showcase(
            //   key: keySix,
            //   description: " نسبة المخاطر من المحفظة كامل",
            //   tooltipBackgroundColor: const Color(0xffFFF8Ee),
            //   child:
            TextFormFieldWidget(
              controller: ratioDangerFromAllWallet
                ..text = equationNotifier.ratioDangerFromAllWallet
                    .toStringAsFixed(2),
              type: TextInputType.emailAddress,
              fillColor: Colors.white,
              suffixIcon: DesginOfIconDisplayAppWidget(
                keyOfWidget: keySix,
              ),
              enabled: false,
              // ),
            ),
            8.verticalSpace,
            AutoSizeTextWidget(text: "العائد من المخاطر", notBoldFont: true),
            8.verticalSpace,
            TextFormFieldWidget(
              controller: returnOfRisk
                ..text = equationNotifier.returnFromRisk.toStringAsFixed(2),
              type: TextInputType.text,
              fillColor: Colors.white,
              enabled: false,
              suffixIcon: DesginOfIconDisplayAppWidget(keyOfWidget: keySeven),
            ),
            14.verticalSpace,
            CheckStateInPostApiDataWidget(
              state: state,
              messageSuccess: "تمت عملية الاضافة بنجاح",
              functionSuccess: () {
                ref.read(walletProvider.notifier).getWalletData();
                Navigator.pop(context);
              },
              bottonWidget: DefaultButtonWidget(
                text: "اضافة",
                textSize: 15,
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    final share = SharesData(
                      walletId: widget.idWallet,
                      name: name.text,
                      stopLossValue: double.tryParse(valueStopLoss.text) ?? 0,
                      priceOfShare: double.tryParse(priceBuyShare.text) ?? 0,
                      numberOfShareToBuy: equationNotifier.numCanBuy,
                      stopValueProfit: double.tryParse(valueStopWin.text) ?? 0,
                      totalExpectedLoss: equationNotifier.totalLossExpected,
                      totalExpectedProfit: equationNotifier.totalProfitExpected,
                      returnFromRisk: equationNotifier.returnFromRisk,
                      theAmountPaidFromTheCoverageRatio:
                          equationNotifier.pricePaid,
                      riskRatio: equationNotifier.returnFromRisk,
                    );
                    ref
                        .read(addShareProvider.notifier)
                        .addShareProcess(share: share);
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
