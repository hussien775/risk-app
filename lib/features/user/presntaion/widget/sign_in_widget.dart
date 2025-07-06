import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:risk/core/app_theme_widget.dart';
import 'package:risk/core/widget/navigateTo.dart';
import 'package:risk/core/widget/text_form_field.dart';
import '../../../../core/strings/pattern.dart';
import '../../../../core/widget/default_button.dart';
import '../../../../core/widget_of_check_state_of_api/check_state_in_post_api_data_widget.dart';
import '../page/confrim_sign_page.dart';
import '../state_mangment/riverpod.dart';

class SignInWidget extends ConsumerWidget {
  SignInWidget({super.key});

  final _formKey = GlobalKey<FormState>();
  final TextEditingController email = TextEditingController();


  @override
  Widget build(BuildContext context, ref) {
    final state = ref.watch(userProvider);
    return Padding(
      padding: EdgeInsets.all(12.0.sp),
      child: Column(
        children: [
          Form(
            key: _formKey,
            child: TextFormFieldWidget(
              controller: email,
              type: TextInputType.emailAddress,
              label: "الايميل",
              isDigitOnly: true,
              fillColor: Colors.white,
              prefix: const Icon(
                Icons.email_outlined,
                color: secondary,
              ),
              isRequired: true,
              patternInput: emailPattern,
              erorrPatternInput: 'تحقق من صحة الايميل الخاص بك',
              erorrFormFieldValidator: "يرجى ادخال البريد الالكتروني الخاص بك",
            ),
          ),
          20.verticalSpace,
          CheckStateInPostApiDataWidget(
            state: state,
            functionSuccess: () {
              print("${state.data}kj");
              navigateTo(context,  ConfrimSignPage(userId: state.data));
            },
            bottonWidget: DefaultButtonWidget(
              text: "تسجيل الدخول",
              onPressed: () {
                final isValid = _formKey.currentState!.validate();
                if (isValid) {
                  ref
                      .read(userProvider.notifier)
                      .signInOrRegistration(email: email.text);
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
