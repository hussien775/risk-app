import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:risk/features/shares/data/model/pay_sell_data.dart';
import '../../../../core/state/state.dart';
import '../../../../core/state/state_data.dart';
import 'package:risk/injection.dart' as di;
import '../../data/reposaitory/reposaitory.dart';

final buyProvider = StateNotifierProvider<PayNotifier, DataState>(
        (ref) => PayNotifier(payReposaitories: di.sl()));
late final SharesReposaitory payReposaitories;


class PayNotifier extends StateNotifier<DataState> {
  final SharesReposaitory payReposaitories;
  PayNotifier({required this.payReposaitories})
      : super(DataState.initial());


  getPayData({required int shareId}) async {

    state = state.copyWith(state: States.loading);
    final user = await payReposaitories.getPayData(shareId);
    user.fold((faliure) {
      state = state.copyWith(state: States.error, exception: faliure);
    }, (data) {

      state = state.copyWith(state: States.loaded, data: data);
    });


  }



}

final addBuyProvider = StateNotifierProvider<AddBuyNotifier, DataState>(
        (ref) => AddBuyNotifier(payReposaitories: di.sl()));

class AddBuyNotifier extends StateNotifier<DataState> {
  final SharesReposaitory payReposaitories;
  AddBuyNotifier({required this.payReposaitories})
      : super(DataState.initial());

  addBuyProcess({required PaySellData buyData}) async {
    state = state.copyWith(state: States.loading);
    final buy = await payReposaitories.addBuyProcess(buyData);
    buy.fold((faliure) {
      state = state.copyWith(state: States.error, exception: faliure);
    }, (_) {
      state = state.copyWith(state: States.loaded,);
    });
  }



}
