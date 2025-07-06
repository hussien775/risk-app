import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:risk/core/app_theme_widget.dart';
import 'package:risk/core/widget/auto_size_text_widget.dart';
import 'package:risk/core/widget/default_button.dart';
import 'package:risk/features/wallet/data/model/deposit_model.dart';
import 'package:risk/features/wallet/data/model/withdraw_model.dart';
import 'package:risk/features/wallet/presentation/widget/deposit_or_withdraw_process_bottomsheet_widget.dart';
import '../../../../core/widget/show_modal_bottom_sheet_widget.dart';

class ContainerOfDepositAndWithdrawWidget extends StatelessWidget {
  const ContainerOfDepositAndWithdrawWidget(
      {super.key,
      required this.isDeposit,
      this.cashInDeposit,
      this.cashInWithDraw,
      required this.idWallet});

  final int idWallet;
  final List<DepositData>? cashInDeposit;
  final List<WithdrawData>? cashInWithDraw;

  final bool isDeposit;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: 80.h,
          color: primary,
        ),
        Padding(
          padding: const EdgeInsets.only(
            left: 8.0,
            right: 10,
          ),
          child: Container(
            width: double.infinity,
            alignment: Alignment.center,
            height: 135.h,
            decoration: BoxDecoration(
              color: primary,
              border: Border.all(color: Colors.white, width: 8),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Padding(
              padding: EdgeInsets.only(left: 10.0.sp, right: 10.sp),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        AutoSizeTextWidget(
                          text: "اجمالي الرصيد",
                          colorText: Colors.white,
                          notBoldFont: true,
                        ),
                        const Spacer(),
                        Image(
                          image: const AssetImage("assest/images/Stroke.png"),
                          width: 35.w,
                          height: 35.h,
                        )
                      ],
                    ),
                    18.verticalSpace,
                    Row(
                      children: [
                        isDeposit == true
                            ? Expanded(
                                child: AutoSizeTextWidget(
                                    text: cashInDeposit!.isEmpty == false
                                        ? cashInDeposit![0].cash.toString()
                                        : "0",
                                    fontSize: 25,
                                    colorText: Colors.white),
                              )
                            : Expanded(
                                child: AutoSizeTextWidget(
                                    text: cashInWithDraw!.isEmpty == false
                                        ? cashInWithDraw![0].cash.toString()
                                        : "0",
                                    fontSize: 25,
                                    colorText: Colors.white),
                              ),
                        DefaultButtonWidget(
                          text: isDeposit == true ? "ايداع" : "سحب",
                          height: 40.h,
                          width: 100.w,
                          background: Colors.white,
                          textColor: primary,
                          onPressed: () {
                            showModalBottomSheetWidget(
                              context: context,
                              page: isDeposit == true
                                  ? DepositOrWithdrawWidget(
                                      isdDeposit: true,
                                      idWallet: idWallet,
                                    )
                                  : DepositOrWithdrawWidget(
                                      isdDeposit: false,
                                      idWallet: idWallet,
                                cash:cashInWithDraw![0].cash ,
                                    ),
                            );
                          },
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
