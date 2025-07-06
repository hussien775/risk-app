import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CallIconsWidget extends StatelessWidget {
  const CallIconsWidget({super.key,required this.nameIcon,this.color});
  final String nameIcon;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      "assest/icons/$nameIcon",
      color:color ,
      fit: BoxFit.none,
     // placeholderBuilder: (BuildContext context) => CircularProgressIndicator(), // يمكنك وضع أي واجهة بديلة هنا

    );
  }
}
