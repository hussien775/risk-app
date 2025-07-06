import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../data_source/remote_data_source.dart';
import '../model/user_data.dart';

class UserReposaitories  {
  final UserRemoteDataSource remoteDataSource;

  UserReposaitories({required this.remoteDataSource,});

  Future<Either<DioException, String>> signInOrRegistration(String email) async {
    try {
    final numCheck =  await remoteDataSource.signInOrRegistration(email);
    return  Right(numCheck);
    } on DioException catch (erorr) {
      print(erorr.type.toString());
      return Left(erorr);
    }
  }

  Future<Either<DioException, String>> confrimCheck(UserData userConfrim) async {
    try {
      final confrim =  await remoteDataSource.confrimEmail(userConfrim);
      return  Right(confrim);
    } on DioException catch (erorr) {
      print(erorr.type.toString());
      return Left(erorr);
    }
  }

  Future<Either<DioException, String>> signUp(UserData userData) async {
    try {
      final user =  await remoteDataSource.signUp(userData);
      return  Right(user);
    } on DioException catch (erorr) {
      print(erorr.type.toString());
      return Left(erorr);
    }
  }
}
