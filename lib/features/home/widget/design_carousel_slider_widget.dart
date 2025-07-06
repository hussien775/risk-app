import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../core/app_theme_widget.dart';

class DesignCarouselSliderWidget extends StatelessWidget {
   DesignCarouselSliderWidget({super.key});
  var controller = PageController();

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
          padding: EdgeInsets.only(left: 15.0.sp,right:15.0.sp ),
          child: SizedBox(
            height: 140.h,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: 120.h,
                  width: MediaQuery.of(context).size.width - 20.w,
                  child: PageView(
                    controller: controller,
                    onPageChanged: (index) {},
                    physics: const BouncingScrollPhysics(),
                    children:  [
                      Container(
                        width: double.infinity,
                        alignment: Alignment.center,
                        height: 135.h,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            image: DecorationImage(
                                image:AssetImage("assest/images/poster.png",),
                                fit: BoxFit.cover
                            )


                        ),
                      ),
                      Container(
                        width: double.infinity,
                        alignment: Alignment.center,
                        height: 135.h,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            image: DecorationImage(
                                image:AssetImage("assest/images/poster.png",),
                                fit: BoxFit.cover
                            )


                        ),
                      ),
                      Container(
                        width: double.infinity,
                        alignment: Alignment.center,
                        height: 135.h,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            image: DecorationImage(
                                image:AssetImage("assest/images/poster.png",),
                                fit: BoxFit.cover
                            )


                        ),
                      ),

                    ],
                  ),
                ),
                12.verticalSpace,
                Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SmoothPageIndicator(
                      controller: controller,
                      count: 3,
                      effect: const ExpandingDotsEffect(
                        dotColor: Color(0x32FCBD68),
                        activeDotColor: secondary,
                        dotHeight: 7,
                        dotWidth: 7,
                        expansionFactor: 2.8,
                        spacing: 5.0,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
