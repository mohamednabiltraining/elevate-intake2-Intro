import 'package:elevate_intake2_intro/domain/usecase/get_categories_use_case.dart';
import 'package:injectable/injectable.dart';


@injectable
class HomeViewModel {
  GetCategoriesUseCase getCategoriesUseCase;

   HomeViewModel(this.getCategoriesUseCase);
  //{
  //   // CategoriesOnlineDataSource categoriesOnlineDataSource = CategoriesOnlineDataSourceImpl(ApiClient());
  //   // CategoriesRepo categoriesRepo = CategoriesRepoImpl(categoriesOnlineDataSource);
  //   // getCategoriesUseCase = GetCategoriesUseCase(categoriesRepo);
  //   // Constructor injection
  //   // function injection
  //   // field injection
  // }

  void loadCategories()async{
    var categoriesList = await getCategoriesUseCase.invoke();
  }
}