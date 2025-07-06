import 'package:dio/dio.dart';

class MessageOfErorrApi {
  static List<String> getExeptionMessage(DioException exception) {
    // if(exception.response !=null&&exception.response!.data!=null){
    //   final data =ErorrModel.fromJson(exception.response!.data!);
    //   return [data.erorrTitle,data.erorrSubTitle];
    // }
    switch (exception.type) {
      case DioExceptionType.connectionError:
        return ["يوجد مشكلة في الاتصال", "الرجاء التحقق من الإتصال بالإنترنت"];
      case DioExceptionType.connectionTimeout:
        return ["شبكة الانترنت ضعيفة", "الرجاء التحقق من الإتصال بالإنترنت"];
      case DioExceptionType.badResponse:
        if (exception.response!.statusCode == 401) {
          return ["عذرا ", "لايوجد تاريخ شراء بنفس التاريخ الذي قمت بادخالة"];
        }
        if (exception.response!.statusCode == 440) {
          return ["تاكد من المدخلات", "رقم الهاتف او كلمة المرور غير صحيحة"];
        } else if (exception.response!.statusCode == 403) {
          return ["عذرا ", "عدد الاسهم اكبر من عدد الاسهم المسموح بالشراء"];
        } else if (exception.response!.statusCode == 402) {
          return [
            "عذرا ",
            "عدد الاسهم اكبر من عدد الاسهم الذي تم شراءها في هذا التاريخ"
          ];
        } else {
          return ["عذرا", "هناك خطا غير معروف"];
        }
      default:
        return ["شبكة الانترنت مقطوعة", "الرجاء التحقق من الإتصال بالإنترنت"];
    }
  }
}

class ErorrModel {
  final int stateCode;
  final String erorrTitle;
  final String erorrSubTitle;

  ErorrModel(
      {required this.stateCode,
      required this.erorrTitle,
      required this.erorrSubTitle});

  factory ErorrModel.fromJson(Map<String, dynamic> json) {
    return ErorrModel(
        stateCode: json['state_code'],
        erorrTitle: json['erorrTitle'],
        erorrSubTitle: json['erorrTitle']);
  }
}
