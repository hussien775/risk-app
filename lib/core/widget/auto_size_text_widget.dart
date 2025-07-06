import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class AutoSizeTextWidget extends StatelessWidget {
  final String text;
  final double? fontSize;
  final Color? colorText;
  final int? maxLines;
  final double?maxFontSize;
  final double?minFontSize;
   bool? centerText=false;
   bool? endText=false;
   bool? notBoldFont=false;

  AutoSizeTextWidget({
    super.key,
    required this.text,
    this.fontSize,
    this.colorText,
    this.maxLines,
    this.centerText,
    this.endText,
    this.notBoldFont,
    this.maxFontSize,
    this.minFontSize,
  });

  @override
  Widget build(BuildContext context) {
    return AutoSizeText(
      text,
      style: TextStyle(
        fontWeight: notBoldFont==true?FontWeight.w500: FontWeight.bold,
        fontSize: fontSize ,
        color: colorText??Colors.black,
        fontFamily: 'tajawal',
      ),
      maxLines: maxLines?? 1,
      maxFontSize:maxFontSize ?? 26,
      minFontSize:minFontSize?? 7,
      overflow: TextOverflow.ellipsis,
      textAlign: centerText==true? TextAlign.center:endText==true?TextAlign.end :TextAlign.start,

    );
  }
}
