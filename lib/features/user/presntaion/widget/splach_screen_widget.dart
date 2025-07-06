import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:risk/core/app_theme_widget.dart';
import 'package:risk/core/widget/auto_size_text_widget.dart';
import 'package:risk/features/user/presntaion/page/sign_in_page.dart';
import 'package:risk/features/user/presntaion/widget/splach_screen_page_view_widget.dart';

import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../core/widget/navigateTo.dart';
import '../../data/data_source/local_data_source.dart';

class SplachScreenWidget extends StatefulWidget {
  const SplachScreenWidget({super.key, required this.userLocalDataSource});

  final UserLocalDataSource userLocalDataSource;

  @override
  State<SplachScreenWidget> createState() => _SplachScreenWidgetState();
}

class _SplachScreenWidgetState extends State<SplachScreenWidget> {
  int currentIndex = 0;
  var controller = PageController();

  @override
  void initState() {
    controller = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0x6CFCBD68),
              Color(0x6CFCBD68),
              Color(0x80FFFFFF),
              Color(0xCCFFFFFF),
            ],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SplachScreenPageViewWidget(
              controller: controller,
              valueChanged: (int index) {
                setState(() {
                  currentIndex = index;
                });
              },
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SmoothPageIndicator(
                  controller: controller,
                  count: boarding.length,
                  effect: const ExpandingDotsEffect(
                    dotColor: Color(0x140063F5),
                    activeDotColor: primary,
                    dotHeight: 7,
                    dotWidth: 7,
                    expansionFactor: 2.8,
                    spacing: 5.0,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 40.h,
            ),
            Padding(
              padding: EdgeInsets.only(left: 15.0.sp, right: 15.sp),
              child: GestureDetector(
                onTap: () {
                  if (currentIndex == boarding.length - 1) {
                    widget.userLocalDataSource
                        .cacheOnBoarding(true)
                        .then((value) {
                      if (value) {
                        SchedulerBinding.instance.addPostFrameCallback((_) {
                          navigateAndFinish(context, const SignInPage());
                        });
                      }
                    });
                  }
                  controller.nextPage(
                      duration: const Duration(milliseconds: 1000),
                      curve: Curves.ease);
                },
                child: Container(
                  height: 53.h,
                  width: double.infinity,
                  padding: EdgeInsets.only(left: 10.0.sp, right: 15.sp),
                  decoration: BoxDecoration(
                    color: primary,
                    borderRadius: BorderRadius.circular(25.h),
                  ),
                  child: Row(
                    children: [
                      Image.asset(
                        "assest/images/row_of_next_page.png",
                        fit: BoxFit.contain,
                      ),
                      const Spacer(),
                      AutoSizeTextWidget(
                        text: "التالي",
                        colorText: Colors.white,
                      ),
                      const Spacer(),
                      CircleAvatar(
                        backgroundColor: Color(0xffFFF8ED),
                        radius: 23.h,
                        child: const Icon(Icons.arrow_forward_ios,
                            color: Color(0xffFCBD68)),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            // DefaultButtonWidget(
            //   height: 45.h,
            //   width: double.infinity,
            //   background: primary,
            //   textColor: Colors.white,
            //   text: "التالي",
            //   onPressed: () {
            //     if (currentIndex == boarding.length - 1) {
            //       widget.userLocalDataSource.cacheOnBoarding(true).then((value) {
            //         if(value){
            //           navigateAndFinish(context, const SignUpAsSellerOrDriverWidget());
            //         }
            //       });
            //     }
            //     controller.nextPage(
            //       duration: const Duration(milliseconds: 1000),
            //       curve: Curves.ease,
            //     );
            //   },
            // ),
          ],
        ),
      ),
    );
  }
}
