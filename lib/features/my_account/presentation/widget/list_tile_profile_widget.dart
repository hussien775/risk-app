import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:risk/core/widget/auto_size_text_widget.dart';
import 'package:risk/core/widget/default_container_widget.dart';

import '../../../../core/app_theme_widget.dart';
import '../../../../core/widget/call_icons_widget.dart';

// ignore: must_be_immutable
class ListTileProfileWidget extends StatelessWidget {
  final Function()? onTap;
  String title;
  String? subTitle = "";
   Widget? trailingIcon;
  final String icon;
  ListTileProfileWidget({
    super.key,
    required this.title,
    this.onTap,
    this.subTitle,
    required this.icon,
    this.trailingIcon
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(bottom: 8.0.sp),
      child: ListTile(
        onTap: onTap,
        minVerticalPadding: 20.h,
        leading:  DefaultContainerWidget(
          radius: 20.h,
          child: Padding(
            padding:  EdgeInsets.all(6.0.sp),
            child: CallIconsWidget(nameIcon: icon,color: secondary,),
          ),
        ),

        title: Padding(
          padding:  EdgeInsets.only(right: 8.0.sp),
          child: AutoSizeTextWidget(
            text: title,
            fontSize: 13.5.sp,
            maxFontSize: 25,
            notBoldFont: false,
            colorText:Colors.grey[800] ,
          ),
        ),
        trailing:trailingIcon ?? const Icon(
          Icons.arrow_forward_ios,
          color: Colors.grey,
          size: 17,
        ),
        titleAlignment: ListTileTitleAlignment.center,
        dense: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.sp),
        ),
        tileColor: Colors.white,
        horizontalTitleGap: 0,

      ),
    );
  }
}
