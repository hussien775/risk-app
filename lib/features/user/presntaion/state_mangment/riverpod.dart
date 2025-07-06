import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:risk/features/user/data/model/user_data.dart';
import '../../../../core/state/state.dart';
import '../../../../core/state/state_data.dart';
import '../../data/reposaitories/reposaitory.dart';
import 'package:risk/injection.dart' as di;


final userProvider =
StateNotifierProvider<UserNotifier, DataState>(
        (ref) => UserNotifier(
      userReposaitories:  di.sl(),
    ));


class UserNotifier extends StateNotifier<DataState> {
   final UserReposaitories userReposaitories;

   UserNotifier({
    required this.userReposaitories,
  }) : super(DataState.initial());


   signInOrRegistration({required String email}) async {
    state = state.copyWith(state: States.loading);
    final user = await userReposaitories.signInOrRegistration(email);
    user.fold((f) {
      state = state.copyWith(state: States.error, exception: f);
    }, (data) {

      state = state.copyWith(state: States.loaded, data: data);
    });
  }


}



final confrimUserProvider =
StateNotifierProvider<ConfrimUserNotifier, DataState>(
        (ref) => ConfrimUserNotifier(
      userReposaitories:  di.sl(),
    ));


class ConfrimUserNotifier extends StateNotifier<DataState> {
  final UserReposaitories userReposaitories;

  ConfrimUserNotifier({
    required this.userReposaitories,
  }) : super(DataState.initial());


  confrimUser({required UserData confrim}) async {
    state = state.copyWith(state: States.loading);
    final user = await userReposaitories.confrimCheck(confrim);
    user.fold((f) {
      state = state.copyWith(state: States.error, exception: f);
    }, (data) {
      state = state.copyWith(state: States.loaded, data: data);
    });
  }



}

final signUserProvider =
StateNotifierProvider<SignUserNotifier, DataState>(
        (ref) => SignUserNotifier(
      userReposaitories:  di.sl(),
    ));


class SignUserNotifier extends StateNotifier<DataState> {
  final UserReposaitories userReposaitories;

  SignUserNotifier({
    required this.userReposaitories,
  }) : super(DataState.initial());


  signUp({required UserData userData}) async {
    state = state.copyWith(state: States.loading);
    final user = await userReposaitories.signUp(userData);
    user.fold((f) {
      state = state.copyWith(state: States.error, exception: f);
    }, (data) {

      state = state.copyWith(state: States.loaded, data: data);
    });
  }
}