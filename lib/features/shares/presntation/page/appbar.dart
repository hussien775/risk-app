
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';



class x extends StatefulWidget {
  @override
  _xState createState() => _xState();
}

class _xState extends State<x>with TickerProviderStateMixin {
  double _scrollPosition = 0.0;

   ScrollController _scrollController = ScrollController();
  late TabController _tabController;
  @override
  void initState() {
    super.initState();
    // إعداد الـ ScrollController لمتابعة التمرير
    _scrollController = ScrollController();

    // إعداد الـ TabController مع عدد التبويبات
    _tabController = TabController(length: 3, vsync: this);

    // الاستماع للتغيير في التمرير
    _scrollController.addListener(() {
      // تحديد موقع التمرير بالنسبة للمحتوى
      double offset = _scrollController.offset;

      // تغيير الـ TabBar بناءً على التمرير
      if (offset >= 0 && offset < 570) {
        _tabController.animateTo(0);  // التبويب الأول
      } else if (offset >= 570 && offset < 970) {
        _tabController.animateTo(1);  // التبويب الثاني
      } else if (offset >= 970) {
        _tabController.animateTo(2);  // التبويب الثالث
      }
    });
  }
  List<Widget> l=[

  ];
  @override
  Widget build(BuildContext context) {
    final appBarHeight = 56.0; // ارتفاع الـ AppBar العادي
    final double opacity = (_scrollPosition / appBarHeight).clamp(0.0 ,1.0); // للتحكم في الشفافية

    return DefaultTabController(
      length: 3, // عدد التبويبات

      child: Scaffold(
        body: NotificationListener<ScrollNotification>(
          onNotification: (ScrollNotification scrollNotification) {
            setState(() {
              _scrollPosition = scrollNotification.metrics.pixels;
              print(_scrollController.offset);
            });
            return true;
          },
          child: Stack(
            children: [
              // محتوى الصفحة بما في ذلك الصورة
              CustomScrollView(

                controller: _scrollController,
                slivers: [
                  SliverToBoxAdapter(
                    child: Column(
                      children: [
                        Image.asset(
                                       "assest/images/poster.png",
                          height: 300,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                        Container(
                          height: 400,
                          padding: EdgeInsets.all(16),
                          color: Colors.red,
                          child: Text(
                            'Scroll to see AppBar transition',
                            style: TextStyle(fontSize: 18),
                          ),
                        ),

                        Container(
                          height: 400,
                          padding: EdgeInsets.all(16),
                          color: Colors.cyan,
                          child: Text(
                            'Scroll to see AppBar transition',
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                        Container(
                          height: 800,
                          color: Colors.amber,
                          padding: EdgeInsets.all(16),
                          child: Text(
                            'Scroll to see AppBar transition',
                            style: TextStyle(fontSize: 18),
                          ),
                        ),

                      ],
                    ),
                  ),
                ],
              ),
              // AppBar الشفاف في الأعلى
              Column(
                children: [
                  if (_scrollPosition <= appBarHeight)
                  AppBar(
                    backgroundColor: Colors.transparent,
                    elevation: 0,
                    title: Text(
                      'Transparent AppBar',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  if (_scrollPosition >= appBarHeight)
                    AnimatedOpacity(
                      duration: Duration(milliseconds: 300), // المدة الزمنية للظهور
                      opacity: opacity,
                      child: Column(
                        children: [
                          AppBar(
                            backgroundColor: Colors.white,
                            elevation: 0,
                            title: Text(
                              'التفاصيل',
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                          Container(
                            color: Colors.blue.withOpacity(opacity),
                            child: TabBar(
                              controller: _tabController,


                              labelColor: Colors.white,
                              unselectedLabelColor: Colors.grey[300],
                              indicatorColor: Colors.white,
                              tabs: [
                                Tab(text: 'Tab 1'),
                                Tab(text: 'Tab 2'),
                                Tab(text: 'Tab 3'),
                              ],
                              onTap: (index){
                                _scrollToTab(index);
                              },
                            ),
                          ),
                        ],
                      ),
                    ),


                ],
              ),
            ],
          ),
        ),

      ),

    );


  }
  void _scrollToTab(int index) {
    double offset = 0.0;
    switch (index) {
      case 0:
        offset = 0.0;
        break;
      case 1:
        offset = 400.0; // المسافة إلى بداية تبويب 2
        break;
      case 2:
        offset = 800.0; // المسافة إلى بداية تبويب 3
        break;
    }
    _scrollController.animateTo(
      offset,
      duration: Duration(milliseconds: 500),
      curve: Curves.ease,
    );
  }
}
////////////////////////////
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
//
// import '../../../../core/app_theme_widget.dart';
//
//
//
// class x extends StatefulWidget {
//   @override
//   _xState createState() => _xState();
// }
//
// class _xState extends State<x> with SingleTickerProviderStateMixin {
//   late TabController _tabController;
//   late ScrollController _scrollController;
//   double _scrollPosition = 0.0;
//   bool _isScrolled = false;
//
//   @override
//   void initState() {
//     super.initState();
//     _tabController = TabController(length: 3, vsync: this);
//     _scrollController = ScrollController();
//
//     // ربط ScrollController بتغيير الصفحة في TabController
//     _scrollController.addListener(() {
//       setState(() {
//         _scrollPosition = _scrollController.offset;
//         final threshold = 150.0; // المسافة التي يظهر عندها العنوان و الـ TabBar
//         if (_scrollPosition >= threshold && !_isScrolled) {
//           _isScrolled = true;
//         } else if (_scrollPosition < threshold && _isScrolled) {
//           _isScrolled = false;
//         }
//       });
//     });
//   }
//
//   @override
//   void dispose() {
//     _tabController.dispose();
//     _scrollController.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final height = MediaQuery.of(context).size.height;
//     final appBarHeight = 56.0;
//     final double opacity = (_scrollPosition / appBarHeight).clamp(0.0, 1.0);
//
//     return Scaffold(
//       body: Stack(
//         children: [
//           // محتوى الصفحة بما في ذلك الصورة
//           CustomScrollView(
//
//             controller: _scrollController,
//             slivers: [
//               SliverAppBar(
//                 expandedHeight: 250.0,
//                 floating: false,
//                 pinned: true,
//                 backgroundColor: Colors.transparent,
//                 flexibleSpace: FlexibleSpaceBar(
//                   background: Image.asset(
//                     "assest/images/poster.png", // رابط الصورة
//                     fit: BoxFit.cover,
//                   ),
//                 ),
//                 actions:!_isScrolled ? [
//                   Icon(Icons.search),
//                   Icon(Icons.cabin),
//                   Icon(Icons.access_alarm),
//
//                 ]:[],
//                 title: _isScrolled ? Text('SliverAppBar with TabBar') : null,
//                 bottom: _isScrolled
//                     ? PreferredSize(
//                   preferredSize: Size.fromHeight(kToolbarHeight),
//                   child: DefaultTabController(
//                     length: 3,
//                     child: Column(
//                       children: [
//                         Container(
//                           color: Colors.blue.withOpacity(opacity),
//                           child: TabBar(
//                             physics: const ClampingScrollPhysics(),
//                             dividerHeight: 0,
//
//                             unselectedLabelColor: Colors.black,
//                             indicatorSize: TabBarIndicatorSize.label,
//                             labelColor: secondary,
//                             labelPadding: const EdgeInsets.symmetric(horizontal: 0),
//                             indicator: BoxDecoration(
//                               borderRadius: BorderRadius.circular(25.sp),
//                               color: const Color(0xffFFF8ED),
//                             ),
//                             tabs: [
//                               Tab(text: 'Tab 1'),
//                               Tab(text: 'Tab 2'),
//                               Tab(text: 'Tab 3'),
//                             ],
//
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 )
//                     : null,
//               ),
//               SliverFillRemaining(
//                 child: TabBarView(
//                   controller: _tabController,
//                   physics: ScrollPhysics(parent: ScrollPhysics()),
//                   children: [
//                     _buildTabContent(1),
//                     _buildTabContent(2),
//                     _buildTabContent(3)
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//
//   }
//
//
//   Widget _buildTabContent(int tabNumber) {
//     return Container(
//       padding: EdgeInsets.all(16),
//       height: 400,
//       color: tabNumber == 1
//           ? Colors.blue.shade100
//           : tabNumber == 2
//           ? Colors.green.shade100
//           : Colors.red.shade100,
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text('Content for Tab $tabNumber', style: TextStyle(fontSize: 24)),
//           SizedBox(height: 10),
//           Text(
//             'This is the content of Tab $tabNumber. You can add more widgets here.',
//             style: TextStyle(fontSize: 18),
//           ),
//         ],
//       ),
//     );
//   }
//
// }
