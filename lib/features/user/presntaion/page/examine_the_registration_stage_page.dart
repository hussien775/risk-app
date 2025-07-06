// ignore_for_file: use_build_context_synchronously
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:risk/features/user/data/data_source/local_data_source.dart';
import 'package:risk/features/user/presntaion/page/sign_in_page.dart';
import 'package:risk/features/wallet/presentation/state_mangment/mange_wallet_riverpod.dart';
import '../../../../core/widget/navigateTo.dart';
import '../../../home/widget/x.dart';
import '../widget/splach_screen_widget.dart';


class CheckTheStateSignOfUser extends ConsumerStatefulWidget {
  final UserLocalDataSource userLocalDataSource;

  const CheckTheStateSignOfUser(
      {super.key,required this.userLocalDataSource });

  @override
  ConsumerState<CheckTheStateSignOfUser> createState() =>
      _CheckTheStateSignOfUserState();
}

class _CheckTheStateSignOfUserState
    extends ConsumerState<CheckTheStateSignOfUser> {
  @override
  void initState() {
    nav();
    super.initState();
  }

  nav() async {
    await Future.delayed(
      const Duration(
        seconds: 2,
      ),
    ).then((value) async {
      var onBoarding = await widget.userLocalDataSource.getOnBoarding();
      if (onBoarding != null) {
        if (widget.userLocalDataSource.getCachedUser() == null) {
          navigateAndFinish(context, const SignInPage());
        } else {
          ref.read(walletProvider.notifier).getWalletData();
          navigateAndFinish(
              context,
              BottomNavigationBarWidget());
        }
      } else {
        navigateAndFinish(
            context,
            SplachScreenWidget(
              userLocalDataSource: widget.userLocalDataSource,
            ));
      }
     });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff404D64),
     // backgroundColor: primary,
    body:  Center(
      child: Image.asset(
        "assest/images/logo_light.png",
        width: 200.w,
        height: 200.h,
      ),
    ),

    );
  }
}
