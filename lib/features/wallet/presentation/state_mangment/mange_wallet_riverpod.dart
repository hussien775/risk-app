import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:risk/features/wallet/data/model/wallet_model.dart';
import '../../../../core/state/state.dart';
import '../../../../core/state/state_data.dart';
import 'package:risk/injection.dart' as di;
import '../../data/reposaitory/reposaitory.dart';

final walletProvider = StateNotifierProvider<WalletNotifier, DataState>(
    (ref) => WalletNotifier(walletReposaitories: di.sl()));

class WalletNotifier extends StateNotifier<DataState> {
  final WalletReposaitories walletReposaitories;
  WalletNotifier({required this.walletReposaitories})
      : super(DataState.initial());

  getWalletData() async {
    state = state.copyWith(state: States.loading);
    final user = await walletReposaitories.getWalletData();
    user.fold((faliure) {
      state = state.copyWith(state: States.error, exception: faliure);
    }, (data) {
      if(data.isEmpty==true)
        {
          state = state.copyWith(state: States.loaded, data: false);
        }
      else {
        state = state.copyWith(state: States.loaded, data: data);
      }
    });
  }



}

final addWalletProvider = StateNotifierProvider<AddWalletNotifier, DataState>(
        (ref) => AddWalletNotifier(walletReposaitories: di.sl()));

class AddWalletNotifier extends StateNotifier<DataState> {
  final WalletReposaitories walletReposaitories;
  AddWalletNotifier({required this.walletReposaitories})
      : super(DataState.initial());

  addWalletProcess({required WalletData wallet}) async {
    state = state.copyWith(state: States.loading);
    final walletData = await walletReposaitories.addWallet(wallet);
    walletData.fold((faliure) {
      state = state.copyWith(state: States.error, exception: faliure);
    }, (_) {
      state = state.copyWith(state: States.loaded,);
    });
  }



}




final changeWalletProviders = StateNotifierProvider<ChangeWalletNotifier, DataState>(
        (ref) => ChangeWalletNotifier());

class ChangeWalletNotifier extends StateNotifier<DataState> {

  int numWallet=0;
  ChangeWalletNotifier()
      : super(DataState.initial());

  getWalletNumber(int num){
    numWallet = num;
    state =state.copyWith(state: States.changeWallet, data: numWallet);
  }

}





