import 'package:another_flushbar/flushbar.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../app_theme_widget.dart';

void flushBarErrorWidget({
  required BuildContext context,
  required String title,
  required String text,
}) {
    Flushbar(
      duration: const Duration(milliseconds: 1500),
      backgroundColor: const Color(0xffff3333),
      message: text,
      title: title,
      flushbarPosition: FlushbarPosition.TOP,
      flushbarStyle: FlushbarStyle.GROUNDED,
    ).show(context);

}
void flushBarWarringWidget({
  required BuildContext context,
  required String text,
}) {
  Flushbar(
    duration: const Duration(milliseconds: 1500),
    backgroundColor:yellowColor,
    message: text,
    title: "تحذير",
    flushbarPosition: FlushbarPosition.TOP,
    flushbarStyle: FlushbarStyle.GROUNDED,
  ).show(context);

}

void flushBarSuccessWidget({
  required BuildContext context,
  required String message,
}) {
  Flushbar(
    duration: const Duration(seconds: 3),
    backgroundColor: const Color(0xff06D6A0),
    message: message,
    title: 'تمت العملية بنجاح',
    flushbarPosition: FlushbarPosition.TOP,
    flushbarStyle: FlushbarStyle.GROUNDED,
  ).show(context);
}

void pressAgainToExit({
  required BuildContext context,
}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      width: 150.w,
      duration: const Duration(seconds: 2),
      content: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
        ),
        alignment: Alignment.center,
        child:
            const AutoSizeText(
              'اضغط مرة اخرى للخروج',
              minFontSize: 3,
              maxFontSize: 20,
              style: TextStyle(fontSize: 15, color: Colors.white,),
              overflow: TextOverflow.ellipsis,
            )

      ),
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.black,
    ),
  );
}
