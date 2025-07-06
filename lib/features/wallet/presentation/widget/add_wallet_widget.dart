import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:risk/core/widget/default_button.dart';
import 'package:risk/core/widget/text_form_field.dart';
import 'package:risk/features/shares/data/model/pay_sell_data.dart';
import 'package:risk/features/shares/presntation/state_mangment/buy_riverpod.dart';
import 'package:risk/features/shares/presntation/state_mangment/sale_riverpod.dart';
import 'package:risk/features/wallet/data/model/wallet_model.dart';
import '../../../../core/widget/date_helper.dart';
import '../../../../core/widget_of_check_state_of_api/check_state_in_post_api_data_widget.dart';
import '../../../wallet/presentation/state_mangment/mange_wallet_riverpod.dart';

// ignore: must_be_immutable
class AddWalletWidget extends ConsumerWidget {
  AddWalletWidget({super.key, });


 final TextEditingController name = TextEditingController();

  final TextEditingController coin = TextEditingController();

  final TextEditingController spare = TextEditingController();

   final TextEditingController riskRatio = TextEditingController();
   final TextEditingController total = TextEditingController();


   final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context,ref) {
    final state = ref.watch(addWalletProvider);

    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            15.verticalSpace,
            AutoSizeText(
              'اسم المحفظة',
              maxFontSize: 20,
              style:
              TextStyle(fontWeight: FontWeight.bold, fontSize: 13.sp),
            ),
            4.verticalSpace,
            TextFormFieldWidget(
              controller: name,
              type: TextInputType.name,
              fillColor: Colors.grey[200],
              isRequired: true,
              erorrFormFieldValidator: "قم بكتابة اسم المحفظة اولا",
            ),
            4.verticalSpace,

            AutoSizeText(
              "العملة",
              maxFontSize: 20,
              style:
              TextStyle(fontWeight: FontWeight.bold, fontSize: 13.sp),
            ),
            4.verticalSpace,
            TextFormFieldWidget(
              controller: coin,
              type: TextInputType.name,
              fillColor: Colors.grey[200],
              isRequired: true,
              erorrFormFieldValidator:
              "قم باضافة نوع العملة اولا ",
            ),
            4.verticalSpace,


            AutoSizeText(
              "المبلغ الاحتياطي",
              maxFontSize: 20,
              style:
              TextStyle(fontWeight: FontWeight.bold, fontSize: 13.sp),
            ),
            4.verticalSpace,
            TextFormFieldWidget(
              controller: spare,
              type: TextInputType.number,
              fillColor: Colors.grey[200],
              isRequired: true,
              erorrFormFieldValidator:
              "قم باضافة المبلغ الاحتياطي اولا ",
            ),
            4.verticalSpace,

            AutoSizeText(
              "نسبة المخاطرة",
              maxFontSize: 20,
              style:
              TextStyle(fontWeight: FontWeight.bold, fontSize: 13.sp),
            ),
            4.verticalSpace,
            TextFormFieldWidget(
              controller: riskRatio,
              type: TextInputType.number,
              fillColor: Colors.grey[200],
              isRequired: true,
              erorrFormFieldValidator:
              "قم باضافة نسبة المخاطرة ",
            ),
            4.verticalSpace,
            15.verticalSpace,
            CheckStateInPostApiDataWidget(
              state: state,
              messageSuccess: "تمت عملية البيع بنجاح",
              functionSuccess: () {

                ref.read(walletProvider.notifier).getWalletData();


                Navigator.pop(context);
              },
              bottonWidget: DefaultButtonWidget(
                text: "اضافة",
                textSize: 15,
                onPressed: () {

                  final isValid = _formKey.currentState!.validate();
                  if (isValid) {
                    final wallet = WalletData(
                        riskRatio: riskRatio.text,
                        coin: coin.text,
                        total: 0,
                        name: name.text,
                        spare: int.parse(spare.text),
                      ratioSpare: spare.text,
                      cash: 0,

                    );
                    ref
                        .read(addWalletProvider.notifier)
                        .addWalletProcess(wallet: wallet);
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
