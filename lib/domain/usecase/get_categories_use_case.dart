import 'package:elevate_intake2_intro/domain/contracts/category/categories_repo.dart';
import 'package:elevate_intake2_intro/domain/model/category.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetCategoriesUseCase{
  CategoriesRepo categoriesRepo;
  GetCategoriesUseCase(this.categoriesRepo);
  Future<List<Category>> invoke(){
    var categoriesList = categoriesRepo.getCategories();
    // logic
    return categoriesList;
  }
}