import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:risk/core/app_theme_widget.dart';
import 'package:risk/core/widget/auto_size_text_widget.dart';
import 'package:risk/core/widget/navigateTo.dart';
import 'package:risk/features/shares/presntation/page/details_of_share_page.dart';
import 'package:risk/features/shares/presntation/state_mangment/sale_riverpod.dart';
import 'package:risk/generated/l10n.dart';

import '../state_mangment/buy_riverpod.dart';
import '../state_mangment/share_riverpod.dart';

class ContainerOfMyShareWidget extends ConsumerWidget {
  const ContainerOfMyShareWidget(
      {super.key,
      //required this.symbolShares,
      required this.nameShares,
      required this.numberShares,
      required this.idShare,
      required this.lossOrProfit,
      required this.ratioSpare,
      required this.cash,
      required this.amount});

  final String nameShares;

  // final int symbolShares;
  final dynamic amount;
  final int numberShares;
  final int idShare;
  final int lossOrProfit;
  final int cash;
  final int ratioSpare;

  @override
  Widget build(BuildContext context, ref) {
    return GestureDetector(
      onTap: () {
        ref.read(shareProvider.notifier).getSharesData(shareId: idShare);
        ref.read(buyProvider.notifier).getPayData(shareId: idShare);
        ref.read(saleProvider.notifier).getSaleData(shareId: idShare);

        navigateTo(
            context,
            DetailsOfShareWidget(
              nameShare: nameShares,
              shareId: idShare,
              cash: cash,
              ratioSpare: ratioSpare,
            ));
      },
      child: Container(
        width: double.infinity,
        height: 65.h,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.sp),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  AutoSizeTextWidget(
                    text: S.of(context).symbolInTableShare,
                    colorText: Colors.grey[500],
                  ),
                  5.verticalSpace,
                  AutoSizeTextWidget(
                    text: idShare.toString(),
                    colorText: Colors.black,
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  AutoSizeTextWidget(
                    text: S.of(context).nameInTableShare,
                    colorText: Colors.grey[500],
                    //  fontSize: 14,
                  ),
                  5.verticalSpace,
                  AutoSizeTextWidget(
                    text: nameShares,
                    colorText: Colors.black,
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  AutoSizeTextWidget(
                    text: S.of(context).priceInTableShare,
                    colorText: Colors.grey[500],
                  ),
                  5.verticalSpace,
                  AutoSizeTextWidget(
                    text: amount.toString(),
                    colorText: Colors.black,
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  AutoSizeTextWidget(
                    text: S.of(context).amountInTableShare,
                    colorText: Colors.grey[500],
                  ),
                  5.verticalSpace,
                  AutoSizeTextWidget(
                    text: numberShares.toString(),
                    colorText: Colors.black,
                    // fontSize: 14,
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  AutoSizeTextWidget(
                    text: S.of(context).valueInTableShare,
                    colorText: Colors.grey[500],
                    //   fontSize: 14,
                  ),
                  5.verticalSpace,
                  AutoSizeTextWidget(
                    text: "-",
                    colorText: Colors.black,
                  ),
                ],
              ),
            ),
            lossOrProfit >= 0
                ? Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        AutoSizeTextWidget(
                          text: S.of(context).profitInTableShare,
                          colorText: Colors.grey[500],
                        ),
                        5.verticalSpace,
                        AutoSizeTextWidget(
                          text: lossOrProfit.toString(),
                          colorText: greenColor,
                        ),
                      ],
                    ),
                  )
                : SizedBox(),
            lossOrProfit < 0
                ? Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        AutoSizeTextWidget(
                          text: S.of(context).lossInTableShare,
                          colorText: Colors.grey[500],
                        ),
                        5.verticalSpace,
                        AutoSizeTextWidget(
                          text: (lossOrProfit * -1).toString(),
                          colorText: Colors.red,
                          //  fontSize: 14,
                        ),
                      ],
                    ),
                  )
                : SizedBox(),
            5.horizontalSpace,
            Container(
              width: 30.w,
              height: 25.h,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.sp),
                color: const Color(0xffFFF8Ee),
              ),
              child: const Icon(Icons.arrow_forward, color: secondary),
            ),
            3.horizontalSpace,
          ],
        ),
      ),
    );
  }
}
