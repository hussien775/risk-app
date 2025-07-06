import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:risk/core/app_theme_widget.dart';
import 'package:risk/core/widget/default_button.dart';
import 'package:risk/core/widget/text_form_field.dart';
import 'package:risk/features/wallet/data/model/deposit_model.dart';
import 'package:risk/features/wallet/data/model/withdraw_model.dart';
import 'package:risk/features/wallet/presentation/state_mangment/deposit_riverpod.dart';
import 'package:risk/features/wallet/presentation/state_mangment/withdraw_riverpod.dart';
import '../../../../core/widget/message_flushbar_widget.dart';
import '../../../../core/widget_of_check_state_of_api/check_state_in_post_api_data_widget.dart';
import '../state_mangment/mange_wallet_riverpod.dart';

// ignore: must_be_immutable
class DepositOrWithdrawWidget extends StatelessWidget {
  DepositOrWithdrawWidget(
      {super.key, required this.isdDeposit, required this.idWallet,this.cash});

  final int idWallet;
  bool isdDeposit;
   int? cash=0;
  TextEditingController amount = TextEditingController();

  TextEditingController report = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Consumer(
        builder: (context, ref, child) {
          final depositState = ref.watch(addDepositProvider);
          final withdrawState = ref.watch(addWithdrawProvider);
          return SizedBox(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  AutoSizeText(
                    isdDeposit == true
                        ? "ايداع مبلغ الى المحفظة "
                        : "سحب مبلغ من المحفظة ",
                    maxFontSize: 20,
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 17.sp),
                  ),
                  15.verticalSpace,
                  TextFormFieldWidget(
                    controller: amount,
                    type: TextInputType.number,
                    label: "المبلغ",
                    fillColor: Colors.grey[200],
                    isRequired: true,
                    erorrFormFieldValidator: "قم بكتابة المبلغ اولا",
                  ),
                  10.verticalSpace,
                  isdDeposit == true
                      ? const SizedBox()
                      : TextFormFieldWidget(
                          controller: report,
                          type: TextInputType.emailAddress,
                          label: "البيان",
                          fillColor: Colors.grey[200],
                          isRequired: true,
                          erorrFormFieldValidator: "قم بكتابة البيان اولا",
                        ),
                  15.verticalSpace,
                  Row(
                    children: [
                      Expanded(
                        child: isdDeposit == true
                            ? CheckStateInPostApiDataWidget(
                                state: depositState,
                                messageSuccess: "تمت عملية الايداع بنجاح",
                                functionSuccess: () {
                                  ref
                                      .read(walletProvider.notifier)
                                      .getWalletData();
                                  ref
                                      .read(depositProvider.notifier)
                                      .getDepositData(
                                        idWallet: idWallet,
                                      );

                                  Navigator.pop(context);
                                },
                                bottonWidget: DefaultButtonWidget(
                                  text: "ايداع",
                                  textSize: 15,
                                  onPressed: () {

                                    ref
                                        .read(addDepositProvider.notifier)
                                        .addDepositProcess(
                                            depositData: DepositData(
                                                idWallet: idWallet,
                                                amount:
                                                    int.parse(amount.text)));
                                  },
                                ),
                              )
                            : CheckStateInPostApiDataWidget(
                                state: withdrawState,
                                messageSuccess: "تمت عملية السحب بنجاح",
                                functionSuccess: () {
                                  ref
                                      .read(withdrawProvider.notifier)
                                      .getWithdrawData(
                                          idWallet: idWallet);
                                  ref
                                      .read(walletProvider.notifier)
                                      .getWalletData();

                                  Navigator.pop(context);
                                },
                                bottonWidget: DefaultButtonWidget(
                                  text: "سحب",
                                  textSize: 15,
                                  onPressed: () {
                                    int price = cash!-int.parse(amount.text);
                                    if(price<0){
                                      flushBarErrorWidget(
                                        context: context,
                                        title:" لا يمكنك اكمال العملية",
                                        text: "المبلغ الذي قمت بسحبة اكبر من المبلغ الموجود في المحفظة",
                                      );
                                    }
                                    else{
                                      ref
                                          .read(addWithdrawProvider.notifier)
                                          .addWithdrawProcess(
                                          withdraw: WithdrawData(
                                              idWallet: idWallet,
                                              amount: int.parse(amount.text),
                                              report: report.text));
                                    }

                                  },
                                ),
                              ),
                      ),
                      12.horizontalSpace,
                      Expanded(
                        child: DefaultButtonWidget(
                          text: "الغاء",
                          textSize: 15,
                          background: Colors.transparent,
                          textColor: primary,
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
