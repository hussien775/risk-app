import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:risk/core/widget/sliver_app_bar_widget.dart';
import 'package:risk/features/shares/presntation/widget/add_share_widget.dart';

import '../widget/add_wallet_widget.dart';

class AddWalletPage extends StatelessWidget {
  const AddWalletPage(
      {super.key,});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SliverAppBarWidget(
            title: "اضافة محفظة",
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
                child: AddWalletWidget()
              ),
            ),
          ),
        ],
      ),
    );
  }
}
