import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:risk/features/shares/data/model/pay_sell_data.dart';
import 'package:risk/features/shares/data/model/shares_data.dart';

import '../../../wallet/data/model/wallet_model.dart';
import '../data_source/remote_data_source.dart';

class SharesReposaitory{
 final SharesRemoteDataSource sharesRemoteDataSource;

  SharesReposaitory({required this.sharesRemoteDataSource});

 Future<Either<DioException, SharesData>> getShareData(int idShare) async {
   try {
     final dataShares = await sharesRemoteDataSource.getShareData(idShare);
     return Right(dataShares);
   } on DioException catch (erorr) {
     print(erorr.type.toString());
     return Left(erorr);
   }
 }

 Future<Either<DioException, List<PaySellData>>> getPayData(int idShare) async {
   try {
     final dataPay = await sharesRemoteDataSource.getPayData(idShare);
     return Right(dataPay);
   } on DioException catch (erorr) {
     print(erorr.type.toString());
     return Left(erorr);
   }
 }

 Future<Either<DioException, List<PaySellData>>> getSellData(int idShare) async {
   try {
     final dataSell = await sharesRemoteDataSource.getSellData(idShare);
     return Right(dataSell);
   } on DioException catch (erorr) {
     print(erorr.type.toString());
     return Left(erorr);
   }
 }

 Future<Either<DioException, Unit>> addBuyProcess(
     PaySellData buy) async {
   try {
     await sharesRemoteDataSource.addBuyProcess(buy);
     return const Right(unit);
   } on DioException catch (erorr) {
     print(erorr.type.toString());
     return Left(erorr);
   }
 }

 Future<Either<DioException, Unit>> addSaleProcess(
     PaySellData buy) async {
   try {
     await sharesRemoteDataSource.addSaleProcess(buy);
     return const Right(unit);
   } on DioException catch (erorr) {
     print(erorr.type.toString());
     return Left(erorr);
   }
 }
 Future<Either<DioException, Unit>> addShares(
     SharesData share) async {
   try {
     await sharesRemoteDataSource.addSharesProcess(share);
     return const Right(unit);
   } on DioException catch (erorr) {
     print(erorr.type.toString());
     return Left(erorr);
   }
 }
}