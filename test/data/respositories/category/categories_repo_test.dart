import 'package:elevate_intake2_intro/data/datasourceContracts/categories_data_source.dart';
import 'package:elevate_intake2_intro/data/respositories/category/categories_repo.dart';
import 'package:elevate_intake2_intro/domain/common/Result.dart';
import 'package:elevate_intake2_intro/domain/model/category.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'categories_repo_test.mocks.dart';

@GenerateMocks([CategoriesOnlineDataSource])
void main() {
  group("categories Repo", () {
    late CategoriesRepoImpl categoriesRepo;
    late CategoriesOnlineDataSource dataSource;
    setUp(() {
      dataSource = MockCategoriesOnlineDataSource();
      categoriesRepo = CategoriesRepoImpl(dataSource);
    },);

    test('when getCategories then'
        'it should call getCategories from datasource', ()async{
      var result = Success<List<Category>>([Category()]);

      provideDummy<Result<List<Category>>>(result);

      when(dataSource.getCategories()).thenAnswer((_)async=>result);

      var actual = await categoriesRepo.getCategories();

      verify(dataSource.getCategories()).called(1);
      expect(actual, equals(result));
    });

  },);
}