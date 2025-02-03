import 'package:dio/dio.dart';
import 'package:elevate_intake2_intro/api/model/response/CategoriesResponse.dart';
import 'package:elevate_intake2_intro/api/model/response/Category_dto.dart';
import 'package:injectable/injectable.dart';

@injectable
@Singleton()
class ApiClient {
  var _dio = Dio(
    BaseOptions(
      connectTimeout: Duration(seconds: 60),
      baseUrl: "https://ecommerce.routemisr.com/",
    )
  );


  Future<List<CategoryDto>?> getCategories()async{
    var dioResponse = await _dio.get("api/v1/categories");
     var response = CategoriesResponse.fromJson(dioResponse.data);
     return response.data;
  }
}