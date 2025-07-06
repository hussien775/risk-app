
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:risk/core/app_theme_widget.dart';

class TextFormFieldWidget extends StatelessWidget {
  final TextEditingController controller;
  final TextInputType type;
  final Color? fillColor;
  final Color? textColor;

  final bool? isPassword;
  final TapRegionCallback? backTap;
  final String? label;
  final bool? enabled;
  final String? hintText;
  final GestureTapCallback? onTap;
  final BorderSide? borderSide;
  final FormFieldValidator? fieldValidator;
  final String? erorrFormFieldValidator;
  final ValueChanged? onSubmit;
  final ValueChanged? onChanged;
  final Widget? prefix;
  final Widget? suffixIcon;
  final bool? expanded;
  final int? maxLine ;
  final bool? isDigitOnly ;
  final String? patternInput;
  final String? erorrPatternInput;
  final bool? isRequired;
  const TextFormFieldWidget({
    super.key,
    required this.controller,
    required this.type,
    this.textColor,
    this.enabled,
    this.backTap,
    this.onTap,
    this.fillColor,
    this.label,
    this.hintText,
    this.borderSide,
    this.fieldValidator,
    this.onSubmit,
    this.onChanged,
    this.isPassword,
    this.prefix,
    this.suffixIcon,
    this.expanded,
    this.maxLine,
    this.erorrFormFieldValidator="",
    this.patternInput="",
    this.isDigitOnly = false,
    this.erorrPatternInput="",
    this.isRequired=false
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTapOutside:backTap ,
      onTap:onTap,
      maxLines:maxLine ?? 1 ,
      controller: controller,
      keyboardType: type,

      obscureText: isPassword ?? false,
      onFieldSubmitted: onSubmit,
      onChanged: onChanged,
      style: TextStyle(color:textColor?? primary),
      cursorColor: primary,
     // inputFormatters:<TextInputFormatter> [
       // isDigitOnly==true? FilteringTextInputFormatter.digitsOnly:FilteringTextInputFormatter.singleLineFormatter,
       // LengthLimitingTextInputFormatter(13),
       // FilteringTextInputFormatter.deny(r'^(((\+|00)9677|0?7)[01378]\d{7}|((\+|00)967|0)[1-7]\d{6})$')
       // FilteringTextInputFormatter.allow(RegExp(r'^(((\+|00)9677|0?7)[01378]\d{7}|((\+|00)967|0)[1-7]\d{6})$')),
      //],
      decoration: InputDecoration(
        hintText: hintText,
        labelText: label,
        border: InputBorder.none,
        fillColor: fillColor ??  Colors.white,
        filled: true,
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.red),
          borderRadius: BorderRadius.circular(12.0),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: borderSide ?? const BorderSide(color: primary,width: 0.5),
          borderRadius: BorderRadius.circular(12.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: borderSide ??const BorderSide(color: primary,width: 0.5),
          borderRadius: BorderRadius.circular(12.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: borderSide ?? BorderSide.none,

          borderRadius: BorderRadius.circular(12.0),
        ),
        prefixIcon: prefix,
        suffixIcon: suffixIcon,
        labelStyle:  TextStyle(
          fontSize: 11.0.sp,
          color:const Color(0xffAEBACB),
          fontWeight: FontWeight.w600,
        ),
        hintStyle:  TextStyle(
          fontSize: 11.sp,
          color:const Color(0xffAEBACB),
          fontWeight: FontWeight.w600,
        ),
        contentPadding: const EdgeInsets.all(10.0),
      ),

      expands: expanded ?? false,
      textAlign: TextAlign.start,
      enabled:enabled??true ,

      validator: (value){
        if ((value == null || value.toString().isEmpty)&&isRequired==true) {
          return erorrFormFieldValidator;
        }
        RegExp regex = RegExp(patternInput!);
        if(!regex.hasMatch(value!)){
          return erorrPatternInput;
        }else {
          return null;
        }
      },
    );
  }
}
