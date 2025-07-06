// import 'package:risk/core/widget/message_flushbar_widget.dart';
// import 'package:flutter/material.dart';
//
// // ignore: must_be_immutable
// class ExitFromAppWidget extends StatelessWidget {
//   ExitFromAppWidget({super.key, required this.child});
//
//
//  final Widget child;
//   DateTime backPress=DateTime.now();
//   @override
//   Widget build(BuildContext context) {
//     return  WillPopScope(
//       child: child,
//       onWillPop: () async {
//         final timeGap = DateTime.now().difference(backPress);
//         final canExit = timeGap >= const Duration(seconds: 2);
//
//         backPress = DateTime.now();
//
//         if (canExit) {
//           pressAgainToExit(context: context);
//           return false;
//         } else {
//           return true;
//         }
//       },
//     );
//   }
// }
