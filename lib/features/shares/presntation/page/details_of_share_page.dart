import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:risk/core/widget/auto_size_text_widget.dart';
import 'package:risk/core/widget/sliver_app_bar_widget.dart';
import 'package:risk/features/shares/data/model/shares_data.dart';
import 'package:risk/features/shares/presntation/widget/sells_of_details_share_widget.dart';
import 'package:risk/features/shares/presntation/widget/general_details_widget.dart';
import 'package:risk/features/shares/presntation/widget/buy_of_details_share_widget.dart';
import '../../../../core/app_theme_widget.dart';
import '../../../../generated/l10n.dart';
import '../state_mangment/buy_riverpod.dart';
import '../widget/container_of_details_share_widget.dart';

class DetailsOfShareWidget extends ConsumerStatefulWidget {
  const DetailsOfShareWidget(
      {super.key, required this.shareId, required this.nameShare,required this.cash,required this.ratioSpare});

  final int shareId;
  final String nameShare;
  final int cash;
  final int ratioSpare;
  @override
  ConsumerState<DetailsOfShareWidget> createState() => _DetailsOfShareWidgetState();
}

class _DetailsOfShareWidgetState extends ConsumerState<DetailsOfShareWidget>
    with TickerProviderStateMixin {
  TabController? tabController;

  @override
  void initState() {
    // TODO: implement initState
    tabController = TabController(length: 4, vsync: this);
    super.initState();
  }

  bool onTapColor = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SliverAppBarWidget(
            title: widget.nameShare,
            isSecondryPage: true,
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(8.0.sp),
              child: DefaultTabController(
                length: 4,
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        backgroundBlendMode: BlendMode.lighten,
                        borderRadius: BorderRadius.circular(25.sp),
                      ),
                      child: TabBar(
                        physics: const ClampingScrollPhysics(),
                        dividerHeight: 0,
                        unselectedLabelColor: Colors.black,
                        indicatorSize: TabBarIndicatorSize.label,
                        labelColor: secondary,
                        labelPadding: const EdgeInsets.symmetric(horizontal: 0),
                        indicator: BoxDecoration(
                          borderRadius: BorderRadius.circular(25.sp),
                          color: const Color(0xffFFF8ED),
                        ),
                        tabs: [
                          Tab(
                            child: Align(
                              alignment: Alignment.center,
                              child: Text(S.of(context).generalDetails),
                            ),
                          ),
                          Tab(
                            child: Align(
                              alignment: Alignment.center,
                              child: Text(S.of(context).sale),
                            ),
                          ),
                          Tab(
                            child: Align(
                              alignment: Alignment.center,
                              child: Text(S.of(context).buy),
                            ),
                          ),
                          Tab(
                            child: Align(
                              alignment: Alignment.center,
                              child: Text(S.of(context).statistics),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: TabBarView(
                          physics: const AlwaysScrollableScrollPhysics(),
                          children: [
                            GeneralDetailsWidget(),
                            SellOfDetailsShareWidget(
                              shareId: widget.shareId,
                            ),
                            BuyOfDetailsShareWidget(
                              shareId: widget.shareId,
                              ratioSpare: widget.ratioSpare,
                              cash: widget.cash,
                            ),
                            Center(
                                child: AutoSizeTextWidget(text: "الاحصائيات"))
                          ]),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
