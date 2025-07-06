import 'package:flutter/material.dart';

class ContainerOfGrediantColorWidget extends StatelessWidget {
  const ContainerOfGrediantColorWidget({super.key,required this.child,this.alignment});
  final Widget child;
  final Alignment? alignment;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment:alignment?? Alignment.center,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomLeft,
          colors: [
            Color(0x0A0063F5),

            Color(0x70F6F7F9),
            Color(0x70F6F7F9),

            Color(0x70F6F7F9),
            Color(0x70F6F7F9),

            Color(0x0A0063F5),
          ],
         // stops: [0.01,0.3 ,0.7 ,0.9],

        ),
      ),
      child: child,
    );
  }
}
