import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:risk/core/widget/text_form_field.dart';
import 'package:risk/features/home/widget/bottom_navigation_bar_widget.dart';
import 'package:risk/features/user/data/model/user_data.dart';
import '../../../../core/widget/default_button.dart';
import '../../../../core/widget/navigateTo.dart';
import '../../../../core/widget_of_check_state_of_api/check_state_in_post_api_data_widget.dart';
import '../../../home/widget/x.dart';
import '../state_mangment/riverpod.dart';

class SignUpWidget extends ConsumerWidget {
  SignUpWidget({super.key,required this.idUser});

  final String idUser;
  final TextEditingController city =  TextEditingController();
  final TextEditingController phone =  TextEditingController();
  final TextEditingController firstName =  TextEditingController();
  final TextEditingController lastName =  TextEditingController();
  final TextEditingController country =  TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context,ref) {
    final state = ref.watch(signUserProvider);
    return Padding(
      padding: EdgeInsets.all(12.0.sp),
      child: Form(
        key:_formKey ,
        child: Column(
          children: [
           // AutoSizeTextWidget(text: "انشاء حساب",fontSize: 18),

            TextFormFieldWidget(
              controller: firstName,
              type: TextInputType.name,
              label: "الاسم",
              fillColor: Colors.white,
              erorrFormFieldValidator: "يرجى ادخال اسمك ",
              isRequired: true,

            ),
            15.verticalSpace,
            TextFormFieldWidget(
              controller:lastName ,
              type: TextInputType.name,
              label: "الالقب",
              fillColor: Colors.white,
              erorrFormFieldValidator: "يرجى ادخال لقبك",
              isRequired: true,
            ),
            15.verticalSpace,
            TextFormFieldWidget(
              controller: phone,
              type: TextInputType.phone,
              label: "رقم الهاتف",
              fillColor: Colors.white,
              isRequired: true,
              erorrFormFieldValidator: "يرجى ادخال رقم الهاتف الخاص بك",

            ),
            15.verticalSpace,
            TextFormFieldWidget(
              controller: country,
              type: TextInputType.name,
              label: "الدولة",
              fillColor: Colors.white,
              isRequired: true,
              erorrFormFieldValidator: "يرجى ادخال الدولة المتواجد بها",
            ),
            15.verticalSpace,
            TextFormFieldWidget(
              controller: city,
              type: TextInputType.name,
              label: "المدينة",
              fillColor: Colors.white,
              isRequired: true,
              erorrFormFieldValidator: "يرجى ادخال المدينة المتواجد بها",
            ),

            20.verticalSpace,
            CheckStateInPostApiDataWidget(
              state: state,
              functionSuccess: () {
                navigateAndFinish(context,  BottomNavigationBarWidget());
              },
              bottonWidget: DefaultButtonWidget(
                text: "انشاء حساب",
                onPressed: () {
                  final isValid = _formKey.currentState!.validate();
                  final userData= UserData(
                    id: int.parse(idUser),
                    phone: phone.text,
                    country: country.text,
                    lastName: lastName.text,
                    firstName: firstName.text,
                    city: city.text
                  );
                  if (isValid) {
                    ref
                        .read(signUserProvider.notifier)
                        .signUp(userData: userData);
                  }
                },
              ),
            ),

          ],
        ),
      ),
    );
  }
}
