import 'package:dio/dio.dart';

class DioHelper {
  static late Dio dioHelperObject;

  static DioInit() {
    print('dio object created ');
    dioHelperObject = Dio(BaseOptions(
        baseUrl: 'https://student.valuxapps.com/api/',
        headers: {'Content-Type': 'application/json'}));
  }
}
