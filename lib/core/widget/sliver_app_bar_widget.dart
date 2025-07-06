import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:risk/core/widget/shimmer_widget.dart';
import '../app_theme_widget.dart';
import 'auto_size_text_widget.dart';
import 'back_button_widget.dart';

class SliverAppBarWidget extends StatelessWidget {
  SliverAppBarWidget(
      {super.key,
      this.widget,
      required this.title,
      this.isSecondryPage,
      this.isHomePage});

  final Widget? widget;
  final String title;
  bool? isSecondryPage = false;
  bool? isHomePage = false;
  bool selected = false;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      slivers: [
        SliverAppBar(
          toolbarHeight: 85.h,
          automaticallyImplyLeading: false,
          backgroundColor: primary,
          flexibleSpace: Padding(
            padding: EdgeInsets.only(top: 15.0.sp),
            child: Center(
              child: Stack(
                children: [
                  ShimmerWidget(
                    child: SvgPicture.asset(
                      "assest/images/waves.svg",
                      //width: double.infinity,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 1.0),
                    child: ShimmerWidget(
                      child: SvgPicture.asset(
                        "assest/images/waves.svg",
                        //  width: double.infinity,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          leading: isSecondryPage == true
              ? const BackButtonWidget()
              : const SizedBox(),
          elevation: 0.0,
          leadingWidth: 58.w,
          centerTitle: true,
          title: isHomePage == true
              ? Image.asset(
                  width: 75.w,
                  height: 75.h,
                  "assest/images/logo_light.png",
                )
              : AutoSizeTextWidget(
                  text: title,
                  colorText: Colors.white,
                  fontSize: 16.sp,
                ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate((context, index) {
            return widget;
          }, childCount: 1),
        ),
      ],
    );
  }
}
