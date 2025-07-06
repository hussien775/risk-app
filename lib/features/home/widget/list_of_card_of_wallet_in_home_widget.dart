import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:risk/core/widget/auto_size_text_widget.dart';
import 'package:risk/features/home/widget/design_of_card_of_wallet_in_home_widget.dart';
import 'package:risk/features/wallet/data/model/wallet_model.dart';
import '../../../core/app_theme_widget.dart';
import '../../wallet/presentation/state_mangment/mange_wallet_riverpod.dart';

class ListOfCardOfWalletInHomeWidget extends StatefulWidget {
  const ListOfCardOfWalletInHomeWidget({super.key, required this.listWallet});

  final List<WalletData> listWallet;

  @override
  State<ListOfCardOfWalletInHomeWidget> createState() =>
      _ListOfCardOfWalletInHomeWidgetState();
}

class _ListOfCardOfWalletInHomeWidgetState
    extends State<ListOfCardOfWalletInHomeWidget> {
  List<Color> colorCard = [primary, secondary, greenColor];

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        ref.watch(walletProvider);
        int numWallet =ref.watch(changeWalletProviders.notifier).numWallet;
        return SizedBox(
          height: 135.h,
          child: CardSwiper(
            cardBuilder: (BuildContext context, int index,
                int horizontalOffsetPercentage, int verticalOffsetPercentage) {
              return DesignOfCardOfWalletInHomeWidget(
                cash: widget.listWallet[index].cash ?? 0,
                color: colorCard[index],
              );
            },

            initialIndex: numWallet??0,
            cardsCount: widget.listWallet.length,

            allowedSwipeDirection:
                const AllowedSwipeDirection.only(left: true, right: true),
            numberOfCardsDisplayed: widget.listWallet.length,
            padding: EdgeInsets.only(left: 15.sp, right: 15.sp),
            backCardOffset: const Offset(0, 18),
            onSwipe: (previousIndex, currentIndex, direction) async {
              print(numWallet.toString());
              ref.read(changeWalletProviders.notifier).getWalletNumber(currentIndex!);
              // setState(() {
              //   numWallet = currentIndex;
              // });
              return true;
            },
          ),
        );
      },
    );
  }
}
