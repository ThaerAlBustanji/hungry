import 'package:dio/dio.dart';

class DioClinet {
  final Dio _dio =Dio(
    BaseOptions(
    baseUrl: "https://sonic-zdi0.onrender.com/api",
    headers: {"Content-Type":"application/json"
    }
  )) ;
  DioClinet(){
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          final token = "thaer token";
          // ignore: unnecessary_null_comparison
          if(token !=null && token.isNotEmpty){
            options.headers["Authorization"]='Baraer$token';
          }
          return handler.next(options);
        }
        ,
      )
    );
  }
  Dio  get dio =>_dio;
}







