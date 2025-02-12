import 'package:elevate_intake2_intro/data/datasourceContracts/categories_data_source.dart';
import 'package:elevate_intake2_intro/domain/common/Result.dart';
import 'package:elevate_intake2_intro/domain/contracts/category/categories_repo.dart';
import 'package:elevate_intake2_intro/domain/model/category.dart';
import 'package:injectable/injectable.dart';
@Injectable(as: CategoriesRepo)
class CategoriesRepoImpl implements CategoriesRepo{
  CategoriesOnlineDataSource _categoriesOnlineDataSource;
  CategoriesRepoImpl(this._categoriesOnlineDataSource);
  @override
  Future<Result<List<Category>>> getCategories() {
    var categories = _categoriesOnlineDataSource.getCategories();
    // Caching -> OnlineFirst => Api -> cache
    // offlineFirst -> offline -> online -> cache
    return categories;
  }


}