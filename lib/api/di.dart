import 'package:dio/dio.dart';
import 'package:elevate_intake2_intro/api/webServices/WebServices.dart';
import 'package:injectable/injectable.dart';

@module
abstract class DioModule{

  static const int connectionTimeOut = 60;
  @Singleton()
  LogInterceptor provideLogger(){
    return LogInterceptor();
  }
  @Singleton()
  Dio provideDio(LogInterceptor logInterceptor){
    var dio = Dio(
        BaseOptions(
          connectTimeout: const Duration(seconds: connectionTimeOut),
          baseUrl: "https://ecommerce.routemisr.com/",
        )
    );
    dio.interceptors.add(logInterceptor);
    return dio;
  }

  @Singleton()
  WebServices provideWebServices(Dio dio){
    return WebServices(dio);
  }
}

