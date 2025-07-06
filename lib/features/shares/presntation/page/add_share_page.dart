import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:risk/core/widget/sliver_app_bar_widget.dart';
import 'package:risk/features/shares/presntation/widget/add_share_widget.dart';

class AddSharePage extends StatelessWidget {
  const AddSharePage(
      {super.key,
      required this.cash,
      required this.investmentAmount,
        required this.idWallet,
      required this.withdrawalAmount});

  final int idWallet;
  final int cash;
  final int investmentAmount;
  final int withdrawalAmount;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SliverAppBarWidget(
            title: "اضافة سهم",
            isSecondryPage: true,
          ),
          Flexible(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(10.0.sp),
                // child: ShowCaseWidget(
                //     builder: (context) => AddShareWidget(),
                //     autoPlay: true,
                //     autoPlayDelay: Duration(seconds: 5)),
                child: AddShareWidget(
                  cash: cash,
                  investmentAmount: investmentAmount,
                  withdrawalAmount: withdrawalAmount,
                  idWallet: idWallet,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
