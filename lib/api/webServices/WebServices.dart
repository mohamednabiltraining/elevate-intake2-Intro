import 'package:dio/dio.dart';
import 'package:elevate_intake2_intro/api/model/response/brand/brand_dto.dart';
import 'package:elevate_intake2_intro/api/model/response/brand/brands_response.dart';
import 'package:elevate_intake2_intro/api/model/response/category/CategoriesResponse.dart';
import 'package:elevate_intake2_intro/api/model/response/category/Category_dto.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

part 'WebServices.g.dart';

@RestApi()
abstract class WebServices{

  factory WebServices(Dio dio, {String baseUrl}) = _WebServices;


  @GET("api/v1/categories")
  Future<CategoriesResponse> getCategories();

  @GET("api/v1/brands")
  Future<BrandsResponse> getBrands();

}