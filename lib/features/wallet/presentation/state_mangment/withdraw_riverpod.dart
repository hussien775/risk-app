import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:risk/features/wallet/data/model/withdraw_model.dart';
import 'package:risk/injection.dart' as di;
import '../../../../core/state/state.dart';
import '../../../../core/state/state_data.dart';
import '../../data/reposaitory/reposaitory.dart';

final withdrawProvider = StateNotifierProvider<WithdrawNotifier, DataState>(
        (ref) => WithdrawNotifier(walletReposaitories: di.sl()));
class WithdrawNotifier extends StateNotifier<DataState> {
  final WalletReposaitories walletReposaitories;

  WithdrawNotifier({required this.walletReposaitories})
      : super(DataState.initial());


  getWithdrawData({required int idWallet}) async {
    state = state.copyWith(state: States.loading);
    final user = await walletReposaitories.getWithdrawData(idWallet);
    user.fold((faliure) {
      state = state.copyWith(state: States.error, exception: faliure);
    }, (data) {
      state = state.copyWith(state: States.loaded, data: data);
    });
  }


}


final addWithdrawProvider = StateNotifierProvider<AddWithdrawNotifier, DataState>(
        (ref) => AddWithdrawNotifier(walletReposaitories: di.sl()));
class AddWithdrawNotifier extends StateNotifier<DataState> {
  final WalletReposaitories walletReposaitories;

  AddWithdrawNotifier({required this.walletReposaitories})
      : super(DataState.initial());




  addWithdrawProcess({required WithdrawData withdraw}) async {
    state = state.copyWith(state: States.loading);
    final deposit = await walletReposaitories.addWithdrawProcess(withdraw);
    deposit.fold((faliure) {
      state = state.copyWith(state: States.error, exception: faliure);
    }, (_) {
      state = state.copyWith(state: States.loaded);
    });
  }
}