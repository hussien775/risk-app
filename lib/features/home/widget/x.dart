import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:risk/core/widget/auto_size_text_widget.dart';
import '../../../core/app_theme_widget.dart';
import '../../../core/widget/call_icons_widget.dart';
import '../../../generated/l10n.dart';
import '../../my_account/presentation/page/account_page.dart';
import '../../shares/presntation/page/my_share_page.dart';
import '../../wallet/presentation/page/mange_wallet_page.dart';
import '../page/home_page.dart';

class BottomNavigationBarWidget extends StatefulWidget {
  const BottomNavigationBarWidget({super.key});

  @override
  State<BottomNavigationBarWidget> createState() =>
      _BottomNavigationBarWidgetState();
}

class _BottomNavigationBarWidgetState extends State<BottomNavigationBarWidget> {
  int currentIndex = 0;

  List pages = [
    HomePage(),
    MangeWalletPage(),
    MySharePage(),
    Center(child: Container(child: AutoSizeTextWidget(text: "الاحصائيات"),)),
    AccountPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: pages[currentIndex],
        bottomNavigationBar: Consumer(
          builder: (context, ref, child) {
            return BottomNavigationBar(
              currentIndex: currentIndex,
              onTap: (index) {
                setState(() {
                  currentIndex = index;
                });
              },
              backgroundColor: Colors.white,
              unselectedItemColor: Colors.grey,
              selectedItemColor: secondary,
              showSelectedLabels: true,
              showUnselectedLabels: true,
              enableFeedback: true,
              type: BottomNavigationBarType.fixed,
              selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
              unselectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),

              items: [
                BottomNavigationBarItem(
                  backgroundColor: Colors.white,
                  icon: SvgPicture.asset(
                    "assest/icons/home-2.svg",
                    color: currentIndex == 0 ? secondary : Colors.grey,
                  ),
                  label: 'الرئيسية',
                ),
                BottomNavigationBarItem(
                  backgroundColor: Colors.white,
                  icon: CallIconsWidget(
                    nameIcon: "wallets.svg",
                    color: currentIndex == 1 ? secondary : Colors.grey,
                  ),
                  label: S.of(context).wallet,
                ),
                BottomNavigationBarItem(
                  backgroundColor: Colors.white,
                  icon: CallIconsWidget(
                    nameIcon: "arrows.svg",
                    color: currentIndex == 2 ? secondary : Colors.grey,
                  ),
                  label: S.of(context).shares,
                ),
                BottomNavigationBarItem(
                  backgroundColor: Colors.white,
                  icon: CallIconsWidget(
                    nameIcon: "graph.svg",
                    color: currentIndex == 3 ? secondary : Colors.grey,
                  ),
                  label: S.of(context).statistics,
                ),
                BottomNavigationBarItem(
                  backgroundColor: Colors.white,
                  icon: CallIconsWidget(
                    nameIcon: "profile.svg",
                    color: currentIndex == 4 ? secondary : Colors.grey,
                  ),
                  label: S.of(context).account,
                ),
              ],
            );
          },
        ));
  }
}
