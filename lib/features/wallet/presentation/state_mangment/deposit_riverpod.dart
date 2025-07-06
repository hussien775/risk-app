import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:risk/features/wallet/data/model/deposit_model.dart';
import 'package:risk/injection.dart' as di;

import '../../../../core/state/state.dart';
import '../../../../core/state/state_data.dart';
import '../../data/reposaitory/reposaitory.dart';

final depositProvider = StateNotifierProvider<DepositNotifier, DataState>(
        (ref) => DepositNotifier(walletReposaitories: di.sl()));
class DepositNotifier extends StateNotifier<DataState> {
  final WalletReposaitories walletReposaitories;

  DepositNotifier({required this.walletReposaitories})
      : super(DataState.initial());


  getDepositData({required int idWallet}) async {
    state = state.copyWith(state: States.loading);
    final user = await walletReposaitories.getDepositData(idWallet);
    user.fold((faliure) {
      state = state.copyWith(state: States.error, exception: faliure);
    }, (data) {
      state = state.copyWith(state: States.loaded, data: data);
    });
  }


}



final addDepositProvider = StateNotifierProvider<AddDepositNotifier, DataState>(
        (ref) => AddDepositNotifier(walletReposaitories: di.sl()));
class AddDepositNotifier extends StateNotifier<DataState> {
  final WalletReposaitories walletReposaitories;

  AddDepositNotifier({required this.walletReposaitories})
      : super(DataState.initial());


  addDepositProcess({required DepositData depositData}) async {
    state = state.copyWith(state: States.loading);
    final deposit = await walletReposaitories.addDepositProcess(depositData);
    deposit.fold((faliure) {
      state = state.copyWith(state: States.error, exception: faliure);
    }, (_) {
      state = state.copyWith(state: States.loaded,);
    });
  }

}

