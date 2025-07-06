import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/state/state.dart';
import '../../../../core/state/state_data.dart';
import 'package:risk/injection.dart' as di;
import '../../data/model/pay_sell_data.dart';
import '../../data/reposaitory/reposaitory.dart';

final saleProvider = StateNotifierProvider<SaleNotifier, DataState>(
        (ref) => SaleNotifier(saleReposaitories: di.sl()));

class SaleNotifier extends StateNotifier<DataState> {
  final SharesReposaitory saleReposaitories;
  SaleNotifier({required this.saleReposaitories})
      : super(DataState.initial());

  getSaleData({required int shareId}) async {
    state = state.copyWith(state: States.loading);
    final user = await saleReposaitories.getSellData(shareId);
    user.fold((faliure) {
      state = state.copyWith(state: States.error, exception: faliure);
    }, (data) {

      state = state.copyWith(state: States.loaded, data: data);

    });
  }
}



final addSaleProvider = StateNotifierProvider<AddSaleNotifier, DataState>(
        (ref) => AddSaleNotifier(saleReposaitories: di.sl()));

class AddSaleNotifier extends StateNotifier<DataState> {
  final SharesReposaitory saleReposaitories;
  AddSaleNotifier({required this.saleReposaitories})
      : super(DataState.initial());

  addSaleProcess({required PaySellData saleData}) async {
    state = state.copyWith(state: States.loading);
    final sale = await saleReposaitories.addSaleProcess(saleData);
    sale.fold((faliure) {
      state = state.copyWith(state: States.error, exception: faliure);
    }, (_) {
      state = state.copyWith(state: States.loaded,);
    });
  }



}


