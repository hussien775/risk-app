import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:risk/core/widget/auto_size_text_widget.dart';
import 'package:risk/core/widget/default_button.dart';

import '../../../../core/widget/text_form_field.dart';

class RateOfRuskWidget extends StatefulWidget {
  const RateOfRuskWidget({super.key});

  @override
  State<RateOfRuskWidget> createState() => _RateOfRuskWidgetState();
}

class _RateOfRuskWidgetState extends State<RateOfRuskWidget> {
  TextEditingController rate = TextEditingController();
  String? x ="";
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.all(15.0.sp),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormFieldWidget(
            controller: rate,
            type: TextInputType.number,
            label: "النسبة",
            fillColor: Colors.grey[200],
          ),
          15.verticalSpace,
          for(int i=1 ; i<10 ; i++)
            Column(
              children: [
                GestureDetector(
                  onTap: (){
                    setState(() {
                      rate.text = i.toString();
                    });
                  },
                  child: SizedBox(
                    width: double.infinity,
                    child:AutoSizeTextWidget(
                      text: "$i %",
                      colorText: i>=5?Colors.red:Colors.black,
                    ),
                  ),
                ),
                12.verticalSpace,
              ],
            ),
          DefaultButtonWidget(text: "اضافة")
        ],
      ),
    );
  }
}
