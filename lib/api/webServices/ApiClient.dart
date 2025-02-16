import 'package:dio/dio.dart';
import 'package:elevate_intake2_intro/api/model/response/brand/BrandsResponse.dart';
import 'package:elevate_intake2_intro/api/model/response/brand/Data_dto.dart';
import 'package:elevate_intake2_intro/api/model/response/category/CategoriesResponse.dart';
import 'package:elevate_intake2_intro/api/model/response/category/Category_dto.dart';
import 'package:elevate_intake2_intro/domain/model/Brand.dart';
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

  Future<List<BrandDto>?> getBrands()async{
    var dioResponse = await _dio.get("api/v1/brands");
     var response = BrandsResponse.fromJson(dioResponse.data);
     return response.data;
  }
}