import 'package:elevate_intake2_intro/domain/model/category.dart';

abstract class CategoriesOnlineDataSource{
  Future<List<Category>> getCategories();
}