import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../data_source/remote_data_source.dart';
import '../model/deposit_model.dart';
import '../model/wallet_model.dart';
import '../model/withdraw_model.dart';

class WalletReposaitories {
  final WalletRemoteDataSource walletRemoteDataSource;

  WalletReposaitories({
    required this.walletRemoteDataSource,
  });

  Future<Either<DioException, Unit>> addWallet(
      WalletData wallet) async {
    try {
      await walletRemoteDataSource.addWallet(wallet);
      return const Right(unit);
    } on DioException catch (erorr) {
      print(erorr.type.toString());
      return Left(erorr);
    }
  }
  Future<Either<DioException, List<WalletData>>> getWalletData() async {
    try {
      final dataWallet = await walletRemoteDataSource.getWalletData();
      return Right(dataWallet);
    } on DioException catch (erorr) {
      print(erorr.type.toString());
      return Left(erorr);
    }
  }

  Future<Either<DioException, List<DepositData>>> getDepositData(
      int idWallet) async {
    try {
      final dataDeposit = await walletRemoteDataSource.getDepositData(idWallet);
      return Right(dataDeposit);
    } on DioException catch (erorr) {
      print(erorr.type.toString());
      return Left(erorr);
    }
  }

  Future<Either<DioException, List<WithdrawData>>> getWithdrawData(
      int idWallet) async {
    try {
      final dataWithdraw =
          await walletRemoteDataSource.getWithdrawData(idWallet);
      return Right(dataWithdraw);
    } on DioException catch (erorr) {
      print(erorr.type.toString());
      return Left(erorr);
    }
  }

  Future<Either<DioException, Unit>> addDepositProcess(
      DepositData deposit) async {
    try {
      await walletRemoteDataSource.addDeposit(deposit);
      return const Right(unit);
    } on DioException catch (erorr) {
      print(erorr.type.toString());
      return Left(erorr);
    }
  }

  Future<Either<DioException, Unit>> addWithdrawProcess(
      WithdrawData withdraw) async {
    try {
      await walletRemoteDataSource.addWithdraw(withdraw);
      return const Right(unit);
    } on DioException catch (erorr) {
      print(erorr.type.toString());
      return Left(erorr);
    }
  }
}
