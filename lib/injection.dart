import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:risk/features/shares/data/reposaitory/reposaitory.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'core/remote_helper/remote_exception.dart';
import 'features/shares/data/data_source/remote_data_source.dart';
import 'features/shares/presntation/state_mangment/share_riverpod.dart';
import 'features/user/data/data_source/local_data_source.dart';
import 'features/user/data/data_source/remote_data_source.dart';
import 'features/user/data/reposaitories/reposaitory.dart';
import 'features/user/presntaion/state_mangment/riverpod.dart';
import 'features/wallet/data/data_source/remote_data_source.dart';
import 'features/wallet/data/reposaitory/reposaitory.dart';
import 'features/wallet/presentation/state_mangment/mange_wallet_riverpod.dart';

final sl = GetIt.instance;

Future<void> init() async {
  /// Riverpod
  /// User Riverpod
  sl.registerFactory(() => UserNotifier(userReposaitories: sl()));
  sl.registerLazySingleton<UserReposaitories>(() =>
      UserReposaitories(remoteDataSource: sl()));
  sl.registerLazySingleton<UserRemoteDataSource>(
          () => UserRemoteDataSource(localDataSource: sl()));
  sl.registerLazySingleton<UserLocalDataSource>(
          () => UserLocalDataSourceImpl(sharedPreferences: sl()));


  //////////////////////////////////////////////////////////////

  sl.registerFactory(() => WalletNotifier(walletReposaitories: sl()));
  sl.registerLazySingleton<WalletReposaitories>(() =>
      WalletReposaitories(walletRemoteDataSource: sl()));
  sl.registerLazySingleton<WalletRemoteDataSource>(
          () => WalletRemoteDataSource(userLocalDataSource: sl()));

////////////////////////////////////////////////////////////////////////////

  sl.registerFactory(() => ShareNotifier(sharesReposaitories: sl()));
  sl.registerLazySingleton<SharesReposaitory>(() =>
      SharesReposaitory(sharesRemoteDataSource: sl()));
  sl.registerLazySingleton<SharesRemoteDataSource>(
          () => SharesRemoteDataSource(userLocalDataSource: sl()));


  ///////////////////////////////////////////////////////////////////////
 final sharedPreferences = await SharedPreferences.getInstance();
 sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => Dio(sl()));
  sl.registerLazySingleton(() => MessageOfErorrApi());
}