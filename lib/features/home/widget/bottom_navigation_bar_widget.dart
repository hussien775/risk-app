// import 'package:auto_size_text/auto_size_text.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:risk/core/app_theme_widget.dart';
// import 'package:risk/features/home/page/home_page.dart';
// import '../../../core/widget/call_icons_widget.dart';
// import '../../../generated/l10n.dart';
// import '../../my_account/presentation/page/account_page.dart';
// import '../../shares/page/my_share_page.dart';
// import '../../wallet/presentation/page/mange_wallet_page.dart';
//
// class bottom_navigation_bar_widget extends StatefulWidget {
//   const bottom_navigation_bar_widget({super.key});
//
//   @override
//   State<bottom_navigation_bar_widget> createState() =>
//       _bottom_navigation_bar_widgetState();
// }
//
// class _bottom_navigation_bar_widgetState
//     extends State<bottom_navigation_bar_widget> {
//
//   int currentIndex = 0;
//
//   final PageStorageBucket bucket = PageStorageBucket();
//   Widget currentPage = HomePage();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body:PageStorage(bucket: bucket, child: currentPage),
//       floatingActionButton: GestureDetector(
//         onTap: () {
//           setState(() {
//             currentPage = HomePage();
//           });
//         },
//         child: CircleAvatar(
//           backgroundColor: Color(0xffFEDCAA),
//           radius: 30,
//           child: SvgPicture.asset(
//             "assest/icons/home-2.svg",
//             color: Color(0xffE9660D),
//           ),
//         ),
//       ),
//       floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
//       bottomNavigationBar: BottomAppBar(
//         height: 60.h,
//         color: Colors.white,
//        // shape: CircularNotchedRectangle(),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceAround,
//           children: [
//             bottomNavigationBarWidget(
//                 onTap: (){
//                   setState(() {
//                     currentPage = MySharePage();
//                     currentIndex = 1;
//                     print(currentIndex);
//
//                   });
//                 },
//                 label: S.of(context).shares,
//                 icon: "arrows.svg",
//                 index: 1,
//                 currentIndex: currentIndex),
//             bottomNavigationBarWidget(
//                 onTap: (){
//                   setState(() {
//                     currentPage=MangeWalletPage();
//                     currentIndex = 2;
//                     print(currentIndex);
//
//                   });
//                 },
//                 label:  S.of(context).wallet,
//                 icon: "wallets.svg",
//                 index: 2,
//                 currentIndex: currentIndex),
//             20.horizontalSpace,
//              bottomNavigationBarWidget(
//                  onTap: (){
//                    setState(() {
//                      currentPage=AccountPage();
//                      currentIndex = 3;
//                      print(currentIndex);
//
//                    });
//                  },
//                 label: S.of(context).statistics,
//                 icon: "graph.svg",
//                 index: 3,
//                 currentIndex: currentIndex),
//             bottomNavigationBarWidget(
//
//                 onTap: (){
//                   setState(() {
//                     currentPage=AccountPage();
//                     currentIndex = 4;
//                     print(currentIndex);
//
//                   });
//                 },
//                 label: S.of(context).account,
//                 icon: "profile.svg",
//                 index: 4,
//                 currentIndex: currentIndex),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget bottomNavigationBarWidget({
//     required String label,
//     required String icon,
//     required int index,
//     required int currentIndex,
//     required Function()? onTap,
//   }) {
//     return InkWell(
//       onTap:onTap,
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           CallIconsWidget(
//            nameIcon:  icon,
//             color: index == currentIndex ? secondary : Colors.grey,
//           ),
//           AutoSizeText(
//             label,
//             style: TextStyle(
//               fontSize: 9.sp,
//               color: index == currentIndex ? secondary : Colors.grey,
//               fontWeight: FontWeight.bold,
//
//             ),
//             maxLines: 1,
//           )
//         ],
//       ),
//     );
//   }
// }
