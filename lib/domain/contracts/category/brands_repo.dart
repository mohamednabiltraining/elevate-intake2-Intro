import 'package:elevate_intake2_intro/domain/common/Result.dart';
import 'package:elevate_intake2_intro/domain/model/Brand.dart';
import 'package:elevate_intake2_intro/domain/model/category.dart';

abstract class BrandsRepo{
  Future<Result<List<Brand>?>> getBrands();
}