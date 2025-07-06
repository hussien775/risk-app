import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../features/wallet/presentation/page/add_wallet_page.dart';
import '../../generated/l10n.dart';
import 'auto_size_text_widget.dart';
import 'default_button.dart';
import 'navigateTo.dart';

class IswalletEmptyWidget extends StatelessWidget {
  const IswalletEmptyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        AutoSizeTextWidget(
          text: 'لا يوجد لديك اي محفظة , قم بانشاء محفظة',
        ),
        DefaultButtonWidget(
          text: S.of(context).buttonAdd,
          width: 70.w,
          height: 45.h,
          onPressed: () {
            navigateTo(context,AddWalletPage());
          },
        ),
      ],
    );
  }
}
