import 'dart:math';

import 'package:elevate_intake2_intro/domain/common/Result.dart';
import 'package:elevate_intake2_intro/domain/contracts/category/categories_repo.dart';
import 'package:elevate_intake2_intro/domain/model/category.dart';
import 'package:elevate_intake2_intro/domain/usecase/get_categories_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'get_categories_use_case_test.mocks.dart';

@GenerateMocks([CategoriesRepo])
void main() {

  group("useCase Test", (){
    late GetCategoriesUseCase useCase;
    late CategoriesRepo repo;
    setUp(() {
      repo = MockCategoriesRepo();
      useCase = GetCategoriesUseCase(repo);
    },);// run before every test

    test('when call invoke from usecase it should'
        'call getCategories from repo', ()async{
      // arrange
      var result = Success<List<Category>>([Category()]);
      provideDummy<Result<List<Category>>>(result);
      when(repo.getCategories()).thenAnswer((_)async=> result,);

      // act
      var actual = await useCase.invoke();
      // function behavior is correct

      // assert , verifications, expectations
      verify(repo.getCategories()).called(1); // call verification
      expect(actual, equals(result));

    });
  });
  // mocking -> inputs
  // watch

}