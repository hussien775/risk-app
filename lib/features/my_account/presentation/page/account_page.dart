import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:risk/core/widget/auto_size_text_widget.dart';
import 'package:risk/core/widget/call_icons_widget.dart';
import '../../../../core/widget/sliver_app_bar_widget.dart';
import '../widget/list_tile_profile_widget.dart';

String x = "ar";
class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  bool boolComplaintOrSuggestionBottomSheet = false;

  @override
  Widget build(BuildContext context) {
    return  Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SliverAppBarWidget(title: "حسابي"),
          Flexible(
            child: SingleChildScrollView(
              physics:const BouncingScrollPhysics(),
              child: Padding(
                padding:  EdgeInsets.only(left: 15.sp,right: 15.sp,bottom: 22.sp,top: 10.sp),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding:  EdgeInsets.only(top: 8.0.sp),
                            child: ListTileProfileWidget(
                              title: "حسين نزار حسين الاشول",
                              icon:"profile.svg",
                              trailingIcon: const SizedBox(),
                              onTap: () {
                              },
                            ),
                          ),
                        ),
                        12.horizontalSpace,
                        Container(
                          width: 60.w,
                          height: 57.h,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15.sp)
                          ),
                          child: const CallIconsWidget(nameIcon: "logout.svg",)
                        ),
                      ],
                    ),
                    6.verticalSpace,

                    AutoSizeTextWidget(
                     text:  "عن المستخدم",
                      fontSize: 15.sp,
                      colorText: const Color(0xff4E607B),
                    ),
                    12.verticalSpace,
                    ListTileProfileWidget(
                      title: "تعديل البيانات الشخصية ",
                      icon: "profile.svg",
                      onTap: () {
                      },
                    ),
                    ListTileProfileWidget(
                      title: "اضافة محفظة",

                      icon: "wallets.svg",
                      onTap: () {
                      //  navigateTo(context, const PrivacyPolicyTermsAndConditionsPage(privacyPolicy: true,));
                      },
                    ),
                    6.verticalSpace,
                    AutoSizeTextWidget(
                      text:  "الاعدادات",
                      fontSize: 15.sp,
                      colorText: const Color(0xff4E607B),
                    ),
                    12.verticalSpace,

                    ListTileProfileWidget(
                      title: "لغة التطبيق",
                      icon: "language.svg",
                      onTap: () {
                        setState(() {
                          x = "en";
                        });
                      },
                    ),
                    6.verticalSpace,
                    AutoSizeTextWidget(
                      text:  "الحماية",
                      fontSize: 15.sp,
                      colorText: const Color(0xff4E607B),
                    ),
                    12.verticalSpace,
                    ListTileProfileWidget(
                      title: "الشروط و الاحكام",
                      icon: "shield-security.svg",
                      onTap: () {
                      },
                    ),
                    ListTileProfileWidget(
                      title: "تفعيل االبصمة",
                      subTitle: "قم بمعرفة الشركة المطورة للتطبيق",
                      icon: "finger.svg",
                      onTap: () {},
                    ),
                    6.verticalSpace,

                    AutoSizeTextWidget(
                      text:  "الدعم الفني",
                      fontSize: 15.sp,
                      colorText: const Color(0xff4E607B),
                    ),
                    12.verticalSpace,

                    ListTileProfileWidget(
                      title: "تواصل معنا",
                      icon: "call-calling.svg",
                      onTap: () {
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      );
  }
}


