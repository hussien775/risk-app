import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:risk/features/user/presntaion/widget/splach_screen_design_widget.dart';

class BoardingModel {
  final String image;
  final String title;
  final String title2;

  final String description;

  BoardingModel({
    required this.image,
    required this.title,
    required this.title2,
    required this.description,
  });
}

List<BoardingModel> boarding = [
  BoardingModel(
    image: "assest/images/money1.png",
    title: "من اسباب خسارة 90% ",
    title2: 'من المتداولين',
    description:
        "عدم ادارة المحفظة وعدم دراسة مخاطر كل صفقة.",
  ),
  BoardingModel(
    image: "assest/images/money2.png",
    title: "الأدارة   ",
    title2: "صارمة للمحفظة",

    description:
        "هي سر نجاح كثير من المتداوليين.",
  ),
  BoardingModel(
    image: "assest/images/logo_dark.png",
    title: "مرحبًا بك في تطبيق ",
    title2: "ريسك",
    description:
    "يسهل ادارة الأسهم من خلال مجموعة خطوات بسيطةومعرفة مخاطر كل صفقة!",
  ),
];

// ignore: must_be_immutable
class SplachScreenPageViewWidget extends StatelessWidget {
  Function(int) valueChanged;
  var controller = PageController();

  SplachScreenPageViewWidget({
    super.key,
    required this.controller,
    required this.valueChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: SizedBox(
        height: 400.dg,
        child: PageView.builder(
          physics: const BouncingScrollPhysics(),
          controller: controller,
          itemCount: boarding.length,
          onPageChanged: valueChanged,
          itemBuilder: (context, index) => SplachScreenDesignWidget(
            image: boarding[index].image,
            title: boarding[index].title,
            title2: boarding[index].title2,
            description: boarding[index].description,
          ),
        ),
      ),
    );
  }
}
