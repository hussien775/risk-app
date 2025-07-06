import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:risk/features/user/data/model/user_data.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class UserLocalDataSource {
  Future<String>? getCachedUser();
  Future<Unit> saveToken(String token);
  Future<bool> cacheOnBoarding(bool value);
  Future<dynamic> getOnBoarding();
  Future<bool> removeData();
}

class UserLocalDataSourceImpl implements UserLocalDataSource {
  final SharedPreferences sharedPreferences;

  UserLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<Unit> saveToken(String token) {
    var userModelsToJson = UserData(
      token: token,
    ).toJson();

    sharedPreferences.setString("Token_USER", json.encode(userModelsToJson));
    return Future.value(unit);
  }

  @override
  Future<String>? getCachedUser() {
    final jsonString = sharedPreferences.getString("Token_USER");
    if (jsonString != null) {
      var decodeJsonData = json.decode(jsonString);
      var jsonToUserModels = UserData.fromJson(decodeJsonData).token;
      return Future.value(jsonToUserModels);
    } else {
      return null;
    }
  }

  @override
  Future<bool> cacheOnBoarding( bool value) async {
    return await sharedPreferences.setBool('ON_BOARDING', value);
  }

  @override
  Future<dynamic> getOnBoarding() {
    final  onBoarding = sharedPreferences.getBool('ON_BOARDING');
    return  Future.value(onBoarding);
  }

  @override
  Future<bool> removeData() async {
    return await sharedPreferences.remove("CACHED_USER");
  }
}

