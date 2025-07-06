import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pinput/pinput.dart';
import 'package:risk/features/user/data/model/user_data.dart';
import 'package:risk/features/user/presntaion/page/sign_up_page.dart';

import '../../../../core/app_theme_widget.dart';
import '../../../../core/widget/default_button.dart';
import '../../../../core/widget/navigateTo.dart';
import '../../../../core/widget_of_check_state_of_api/check_state_in_post_api_data_widget.dart';
import '../../../home/page/home_page.dart';
import '../../../home/widget/bottom_navigation_bar_widget.dart';
import '../../../home/widget/x.dart';
import '../../../wallet/presentation/state_mangment/mange_wallet_riverpod.dart';
import '../state_mangment/riverpod.dart';

class PinOfConfrimWidget extends ConsumerWidget {
  PinOfConfrimWidget({super.key, required this.idUser});

  final String idUser;
  final TextEditingController otpCode = TextEditingController();

  @override
  Widget build(BuildContext context, ref) {
    final state = ref.watch(confrimUserProvider);
    final stateWallet = ref.watch(walletProvider);
    return Padding(
      padding: EdgeInsets.only(left: 12.0.sp, right: 12.sp),
      child: Column(
        children: [
          Pinput(
            controller: otpCode,
            length: 6,
            focusedPinTheme: PinTheme(
              width: 75.w,
              height: 45.h,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(10.sp)),
                  border: Border.all(color: primary)),
              textStyle: const TextStyle(
                color: primary,
                fontFamily: 'tajawal',
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            defaultPinTheme: PinTheme(
              width: 75.w,
              height: 45.h,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(10.sp)),
              ),
              textStyle: const TextStyle(
                color: primary,
                fontFamily: 'tajawal',
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          18.verticalSpace,
          CheckStateInPostApiDataWidget(
            state: state,
            functionSuccess: () {
              if (state.data == "has account") {
                print("has");
                ref.read(walletProvider.notifier).getWalletData();
                navigateAndFinish(context, BottomNavigationBarWidget());
              } else if (state.data == "new account") {
                navigateAndFinish(
                    context,
                    SignUpPage(
                      idUser: idUser,
                    ));
              }
            },
            bottonWidget: DefaultButtonWidget(
              text: "تاكيد ",
              onPressed: () {
                final confrimData =
                    UserData(otpCode: otpCode.text, id: int.parse(idUser));
                ref
                    .read(confrimUserProvider.notifier)
                    .confrimUser(confrim: confrimData);
              },
            ),
          ),
        ],
      ),
    );
  }
}
