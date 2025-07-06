// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:risk/features/user/presntaion/widget/add_figer_print_widget.dart';
// import 'package:risk/features/user/presntaion/widget/image_of_waves_widget.dart';
// import 'package:risk/features/user/presntaion/widget/string_of_describe_pages_widget.dart';
// import '../widget/container_of_grediant_color_widget.dart';
// import '../widget/logo_of_sign_widget.dart';
//
// class AddFingerPrintPage extends StatelessWidget {
//   const AddFingerPrintPage({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor:const Color(0xffF6F7F9),
//       body: ContainerOfGrediantColorWidget(
//         alignment: Alignment.topCenter,
//         child:  SingleChildScrollView(
//           physics:const BouncingScrollPhysics(),
//           child: Padding(
//             padding:  EdgeInsets.only(top: 50.0.sp),
//             child:  Column(
//               children: [
//                 const ImageOfWaveWidget(),
//                 const LogoOfSignWidget(),
//                 40.verticalSpace,
//                 const StringOfDescribePagesWidget(
//                   title: "تعيين بصمة الإصبع الخاصة بك",
//                   subTitle:
//                   "أضف بصمة الإصبع لتتمكن من خلالها الدخول إلى حسابك",
//                 ),
//                 20.verticalSpace,
//                 AddFingerPrintWidget(),
//               ],
//             ),
//           ),
//         ),
//       ),
//
//     );
//   }
// }
//
