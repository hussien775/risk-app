import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:risk/features/user/presntaion/widget/image_of_waves_widget.dart';
import 'package:risk/features/user/presntaion/widget/no_send_pin_in_confrim_widget.dart';
import 'package:risk/features/user/presntaion/widget/pin_of_confrim_widget.dart';
import 'package:risk/features/user/presntaion/widget/string_of_describe_pages_widget.dart';
import '../widget/container_of_grediant_color_widget.dart';
import '../widget/logo_of_sign_widget.dart';

class ConfrimSignPage extends StatelessWidget {
  const ConfrimSignPage({super.key,required this.userId});
  final String userId;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF6F7F9),
      body: ContainerOfGrediantColorWidget(
        alignment: Alignment.topCenter,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding:  EdgeInsets.only(top: 40.0.sp),
            child: Column(
              children: [
                const ImageOfWaveWidget(),
                const LogoOfSignWidget(),
                60.verticalSpace,
                const StringOfDescribePagesWidget(
                  title: "تاكيد العملية",
                  subTitle:
                      "تحقق من رسائل الايميل الخاص بك وأدخل رمز التحقق لإكمال العملية",
                ),
                 20.verticalSpace,
                PinOfConfrimWidget(idUser: userId),
                20.verticalSpace,
                const NoSendPinOfConfrimWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
