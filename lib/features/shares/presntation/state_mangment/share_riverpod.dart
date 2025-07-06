import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:risk/features/shares/data/model/shares_data.dart';

import '../../../../core/state/state.dart';
import '../../../../core/state/state_data.dart';
import 'package:risk/injection.dart' as di;

import '../../data/reposaitory/reposaitory.dart';

final shareProvider = StateNotifierProvider<ShareNotifier, DataState>(
        (ref) => ShareNotifier(sharesReposaitories: di.sl()));

class ShareNotifier extends StateNotifier<DataState> {
  final SharesReposaitory sharesReposaitories;
  ShareNotifier({required this.sharesReposaitories})
      : super(DataState.initial());

  getSharesData({required int shareId}) async {
    state = state.copyWith(state: States.loading);
    final user = await sharesReposaitories.getShareData(shareId);
    user.fold((faliure) {
      state = state.copyWith(state: States.error, exception: faliure);
    }, (data) {

      state = state.copyWith(state: States.loaded, data: data);

    });
  }



}
final addShareProvider = StateNotifierProvider<AddShareNotifier, DataState>(
        (ref) => AddShareNotifier(sharesReposaitories: di.sl()));

class AddShareNotifier extends StateNotifier<DataState> {
  final SharesReposaitory sharesReposaitories;
  AddShareNotifier({required this.sharesReposaitories})
      : super(DataState.initial());

  addShareProcess({required SharesData share}) async {
    state = state.copyWith(state: States.loading);
    final buy = await sharesReposaitories.addShares(share);
    buy.fold((faliure) {
      state = state.copyWith(state: States.error, exception: faliure);
    }, (_) {
      state = state.copyWith(state: States.loaded,);
    });
  }
  }






