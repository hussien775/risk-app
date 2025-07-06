import '../../../../core/remote_helper/remote_request.dart';
import '../model/user_data.dart';
import 'local_data_source.dart';

class UserRemoteDataSource {
  final UserLocalDataSource localDataSource;

  UserRemoteDataSource({required this.localDataSource});

  Future<String> signInOrRegistration(String email) async {
    final response = await RemoteRequest.postData(
        path: "logInOrRegistration", data: UserData(email: email).toJson());
    return response.data;
  }

  Future<dynamic> confrimEmail(UserData userConfrim) async {
    final response = await RemoteRequest.postData(
        path: "email_verified",
        data: UserData(id: userConfrim.id, otpCode: userConfrim.otpCode)
            .toJson());
    if (response.statusCode == 200) {
      localDataSource.saveToken(response.data);

       print(response.data);
      print("has account");

      return "has account";
    } else if (response.statusCode == 202) {
       print(response.data);
      return "new account";
    }
  }

  Future<String> signUp(UserData userData) async {
    final response = await RemoteRequest.postData(
        path: "registration",
        data: UserData(
                id: userData.id,
                firstName: userData.firstName,
                lastName: userData.lastName,
                city: userData.city,
                country: userData.country,
                phone: userData.phone)
            .toJson());
    localDataSource.saveToken(response.data);
    return response.data;
  }
}
