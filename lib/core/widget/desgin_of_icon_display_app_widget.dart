import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class DesginOfIconDisplayAppWidget extends StatefulWidget {
   const DesginOfIconDisplayAppWidget({super.key,required this.keyOfWidget});
  final GlobalKey keyOfWidget;

  @override
  State<DesginOfIconDisplayAppWidget> createState() => _DesginOfIconDisplayAppWidgetState();
}

class _DesginOfIconDisplayAppWidgetState extends State<DesginOfIconDisplayAppWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          // setState(() {
          //   WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
          //     ShowCaseWidget.of(context).startShowCase([widget.keyOfWidget]);
          //   });
          // });

        },
        child: SvgPicture.asset("assest/icons/info-circle.svg",fit: BoxFit.none,)
    );
  }
}
