import 'package:elevate_intake2_intro/domain/common/Result.dart';
import 'package:elevate_intake2_intro/domain/model/category.dart';

abstract class CategoriesOnlineDataSource{
  Future<Result<List<Category>>> getCategories();
}