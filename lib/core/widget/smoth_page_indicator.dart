import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../app_theme_widget.dart';

class SmoothPageIndicatorWidget extends StatefulWidget {
  final boardController = PageController();

  SmoothPageIndicatorWidget({super.key});

  @override
  State<SmoothPageIndicatorWidget> createState() =>
      _SmoothPageIndicatorWidgetState();
}

class _SmoothPageIndicatorWidgetState extends State<SmoothPageIndicatorWidget> {
  @override
  Widget build(BuildContext context) {
    return Stack(alignment: Alignment.bottomCenter, children: [
      SizedBox(
        height: 150.h,
        width: double.infinity,
        child: PageView.builder(
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index) => Container(
            margin: const EdgeInsets.symmetric(horizontal: 17.5),
            decoration: BoxDecoration(
              color: secondary,
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          itemCount: 4,
          controller: widget.boardController,
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(bottom: 4.0),
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          SmoothPageIndicator(
            controller: widget.boardController,
            count: 4,
            effect: const ExpandingDotsEffect(
              dotColor: primary,
              activeDotColor: Colors.white,
              dotHeight: 8,
              dotWidth: 8,
              expansionFactor: 3.0,
              spacing: 5.0,
            ),
          ),
        ]),
      ),
    ]);
  }
}
