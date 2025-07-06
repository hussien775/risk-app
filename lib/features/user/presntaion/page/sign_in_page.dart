import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:risk/features/user/presntaion/widget/image_of_waves_widget.dart';
import '../widget/container_of_grediant_color_widget.dart';
import '../widget/logo_of_sign_widget.dart';
import '../widget/sign_in_widget.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:const Color(0xffF6F7F9),
      body: ContainerOfGrediantColorWidget(
        alignment: Alignment.topCenter,
        child:  SingleChildScrollView(
          physics:const BouncingScrollPhysics(),
          child: Padding(
            padding:  EdgeInsets.only(top: 50.0.sp),
            child: Column(
              children: [
                const ImageOfWaveWidget(),
                15.verticalSpace,

                const LogoOfSignWidget(),
                45.verticalSpace,
                SignInWidget(),
                15.verticalSpace,

              ],
            ),
          ),
        ),
      ),

    );
  }
}

