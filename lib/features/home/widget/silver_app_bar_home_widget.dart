import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../core/app_theme_widget.dart';
import '../../user/presntaion/widget/splach_screen_page_view_widget.dart';

class SliverAppBarHomeWidget extends StatefulWidget {
  SliverAppBarHomeWidget({super.key, this.widget, required this.title});

  Widget? widget;
  final String title;

  @override
  State<SliverAppBarHomeWidget> createState() => _SliverAppBarHomeWidgetState();
}

class _SliverAppBarHomeWidgetState extends State<SliverAppBarHomeWidget>
    with TickerProviderStateMixin {
  int currentIndex = 0;
  var controller = PageController();


  AnimationController? _animationController;

  @override
  void initState() {
    controller = PageController(initialPage: 0);
    _animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1))
          ..repeat(reverse: true);
    super.initState();
  }

  dynamic animationController(AnimationController animationController) {
    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 5))
          ..repeat(reverse: true);
    return animationController;
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      slivers: [
        SliverAppBar(
          toolbarHeight: 85.h,
          pinned: true,
          automaticallyImplyLeading: false,
          backgroundColor: primary,
          flexibleSpace: Padding(
            padding: EdgeInsets.only(top: 15.0.sp),
            child: Center(
              child: FadeTransition(
                opacity:
                    Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
                  parent: _animationController!,
                  curve: Curves.easeInOut,
                )),
                child: SvgPicture.asset(
                  width: double.infinity,
                  height: 70.h,
                  "assest/images/waves.svg",
                  color: Colors.white,
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
          title: Image.asset(
            "assest/images/light_logo.png",
            fit: BoxFit.contain,
          ),
          elevation: 0.0,
          leadingWidth: 90.w,
          centerTitle: true,
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate((context, index) {
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
                              count: boarding.length,
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
          }, childCount: 1),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _animationController!.dispose();
    controller.dispose();
    super.dispose();
  }
}
