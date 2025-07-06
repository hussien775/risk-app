import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/widget/auto_size_text_widget.dart';
import '../../../../core/widget/show_modal_bottom_sheet_widget.dart';

class DropdownOfRateWidget extends StatelessWidget {
  const DropdownOfRateWidget({super.key,required this.pageOfModelSheet,required this.ratioText});
  final Widget pageOfModelSheet;
  final String ratioText;
  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: () {
        showModalBottomSheetWidget(
          context: context,
          page: pageOfModelSheet,
        );
      },
      child: Container(
        height: 50,
        width: double.infinity,
        alignment: Alignment.centerRight,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Padding(
          padding: EdgeInsets.only(right: 8.0.sp, left: 10.sp),
          child: Row(
            children: [
              AutoSizeTextWidget(
                text: ratioText,
                colorText: Colors.red,
              ),
              const Spacer(),
              const Icon(Icons.keyboard_arrow_down_rounded),
            ],
          ),
        ),
      ),
    );
  }
}
