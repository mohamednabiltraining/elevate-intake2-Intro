import 'package:elevate_intake2_intro/domain/model/category.dart';

abstract class CategoriesRepo{
  Future<List<Category>> getCategories();
}